import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:uanimurs/Logic/models/account_model.dart';
import 'package:uanimurs/Logic/models/watch_history.dart';
import '../models/anime_model.dart';
import '../models/settings_model.dart';
import 'package:collection/collection.dart';

class AccountCubit extends Cubit<List<AccountModel>> {
  final Isar isar;

  AccountCubit(this.isar) : super([]) {
    _loadAccounts();
  }

  AccountModel? get activeAccount => state.firstWhereOrNull((acc) => acc.isActive);

  // ---------------------------- Account Management ----------------------------

  Future<void> createAccount(
    String username,
    String? pfp, {
    SettingsModel? settings,
  }) async {
    try {
      final newAccount = AccountModel(
        username: username,
        accountType: "Local Account",
        pfp: pfp,
        settings: settings ?? SettingsModel(),
      );

      await isar.writeTxn(() async {
        await isar.accountModels.put(newAccount);
      });

      await setActiveAccount(newAccount);
      await _reloadAccounts();
    } catch (e) {
      print('Error creating account: $e');
    }
  }

  // Set the active account

  Future<void> setActiveAccount(AccountModel account) async {
    try {
      await isar.writeTxn(() async {
        final allAccounts = await isar.accountModels.where().findAll();
        for (var acc in allAccounts) {
          acc.isActive = acc.id == account.id;
          await isar.accountModels.put(acc);
        }
      });

      await _reloadAccounts();
    } catch (e) {
      print('Error setting active account: $e');
    }
  }

  // Update Account
  Future<void> updateAccount({
    String? username,
    String? pfp,
  }) async {
    final currentAccount = activeAccount;
    if (currentAccount == null) return;

    // Modify the existing instance directly
    if (username != null) currentAccount.username = username;
    if (pfp != null) currentAccount.pfp = pfp;

    await isar.writeTxn(() async {
      await isar.accountModels.put(currentAccount);
    });

    await _reloadAccounts();
  }

  // Delete Account
  Future<void> deleteAccount() async{
    final currentAccount = activeAccount;
    if (currentAccount == null) return;
    await isar.writeTxn(() async {
      await isar.accountModels.delete(currentAccount.id);
    });
    await _reloadAccounts();
  }

  // Add search term to history
  Future<void> addToSearchHistory(String searchTerm) async {
    final account = activeAccount;
    if (account == null) return;

    await isar.writeTxn(() async {
      // Remove if it already exists
      final updatedHistory = account.searchHistory.toList();
      updatedHistory.remove(searchTerm);
      updatedHistory.insert(0, searchTerm);

      // Optional: Limit to last 20
      if (updatedHistory.length > 20) {
        updatedHistory.removeRange(20, updatedHistory.length);
      }

      account.searchHistory = updatedHistory; // ✅ REASSIGN THE LIST


      await isar.accountModels.put(account);

    });

    await _reloadAccounts();
  }


  // Remove search term from history
  Future<void> removeSearchTerm(String term) async {
    final account = activeAccount;
    if (account == null) return;

    await isar.writeTxn(() async {
      // Create a new growable list from the fixed-length one
      final updatedList = List<String>.from(account.searchHistory);
      updatedList.remove(term);

      // Reassign the growable list to account
      account.searchHistory = updatedList;

      await isar.accountModels.put(account);
    });

    await _reloadAccounts(); // Optional UI update
  }



  // Clear search history
  Future<void> clearSearchHistory() async {
    final account = activeAccount;
    if (account == null) return;

    await isar.writeTxn(() async {
      account.searchHistory = []; // Assigning a new growable list
      await isar.accountModels.put(account);
    });

    await _reloadAccounts();
  }



  // ---------------------------- Watchlist Management ----------------------------

  // Add an anime to the watchlist

  Future<void> addToWatchList(AnimeModel anime) async {
    final currentAccount = activeAccount;
    if (currentAccount == null) return;

    await isar.writeTxn(() async {
      final existingAnime = await isar.animeModels.filter().alIdEqualTo(anime.alId).findFirst();
      final animeToAdd = existingAnime ?? anime;

      if (existingAnime == null) {
        await isar.animeModels.put(anime);
      }
      currentAccount.watchList.add(animeToAdd);
      await currentAccount.watchList.save();
    });
    await _reloadAccounts();
  }

  // Remove an anime from the watchlist

  Future<void> removeFromWatchList(AnimeModel anime) async {
    final currentAccount = activeAccount;
    if (currentAccount == null) return;

    await isar.writeTxn(() async {
      // Make sure the anime has an ID
      AnimeModel? existing = await isar.animeModels.get(anime.id);
      if (existing == null) {
        final storedId = await isar.animeModels.put(anime);
        anime.id = storedId; // if you're using a copy method
      }

      // Remove anime from current account's watch list
      currentAccount.watchList.remove(anime);
      await currentAccount.watchList.save();

      // Check if any other accounts are still linking this anime
      final linksCount = await isar.accountModels
          .filter()
          .watchList((q) => q.alIdEqualTo(anime.alId))
          .count();

      if (linksCount == 0) {
        await isar.animeModels.delete(anime.id);
      }
    });

    await _reloadAccounts();
  }




  // Clear the watchlist of the active account

  Future<void> clearWatchList() async {
    final currentAccount = activeAccount;
    if (currentAccount == null) return;

    await isar.writeTxn(() async {
      currentAccount.watchList.clear();
      await currentAccount.watchList.save();
    });

    await _reloadAccounts();
  }

  // Add anime to watch history
  Future<void> addOrUpdateWatchHistory(WatchHistory newEntry) async {
    final account = activeAccount;
    if (account == null) return;

    await isar.writeTxn(() async {
      // Try to find existing entry by anilistId
      final existing = await isar.watchHistorys
          .filter()
          .anilistIdEqualTo(newEntry.anilistId)
          .findFirst();

      if (existing != null) {
        // Update fields
        existing
          ..anime = newEntry.anime
          ..name = newEntry.name
          ..image = newEntry.image
          ..watchTime = newEntry.watchTime
          ..totalTime = newEntry.totalTime
          ..lastWatched = DateTime.now()
          ..streamingLink = newEntry.streamingLink
          ..watchedEpisodes = newEntry.watchedEpisodes
          ..totalEpisodes = newEntry.totalEpisodes
          ..watchingEpisode = newEntry.watchingEpisode;

        await isar.watchHistorys.put(existing);

        // Remove then re-add to reorder it as the last added (top-most when fetched)
        account.watchHistory.remove(existing);
        account.watchHistory.add(existing);
      } else {
        // Save new entry
        final id = await isar.watchHistorys.put(newEntry);
        newEntry.id = id;
        account.watchHistory.add(newEntry);
      }

      await account.watchHistory.save(); // Save link changes
    });

    await _reloadAccounts(); // Refresh state if needed
  }


  // Remove anime from watch history

  Future<void> removeFromWatchHistory(WatchHistory entry) async {
    final account = activeAccount;
    if (account == null) return;

    await isar.writeTxn(() async {
      account.watchHistory.remove(entry);
      await account.watchHistory.save();

      // Check if entry still linked to any other account
      final isStillLinked = await isar.accountModels
          .filter()
          .watchHistory((q) => q.anilistIdEqualTo(entry.anilistId))
          .count() > 0;

      if (!isStillLinked) {
        await isar.watchHistorys.delete(entry.id);
      }
    });

    await _reloadAccounts();
  }

  // Load watch history for the active account
  Future<void> loadWatchHistory() async {
    final account = activeAccount;
    if (account == null) return;
    await account.watchHistory.load();
  }





  // ---------------------------- Internal Utilities ----------------------------

  Future<void> _loadAccounts() async {
    try {
      final accounts = await isar.accountModels.where().findAll();
      emit(accounts);
    } catch (e) {
      print('Error loading accounts: $e');
    }
  }

  Future<void> _reloadAccounts() async {
    final accounts = await isar.accountModels.where().findAll();
    for (var account in accounts) {
      await account.watchList.load();
    }
    emit(accounts);
  }

  // ---------------------------- Settings Management ----------------------------

  Future<void> updateSettings(
    void Function(SettingsModel settings) update,
  ) async {
    final currentAccount = activeAccount;
    if (currentAccount == null) return;

    update(currentAccount.settings);

    await isar.writeTxn(() async {
      await isar.accountModels.put(currentAccount);
    });

    await _reloadAccounts();
  }

  // ---------------------------- Theme Management ----------------------------

  Future<void> updateThemeMode(int value) async {
    await updateSettings((settings) {
      settings.appearance = settings.appearance.copyWith(themeMode: value);
    });
  }
}
