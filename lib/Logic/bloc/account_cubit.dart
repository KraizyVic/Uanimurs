import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:uanimurs/Logic/models/account_model.dart';
import 'package:uanimurs/Logic/models/watch_history.dart';
import 'package:uanimurs/UI/custom_widgets/widgets.dart';
import 'package:uanimurs/constants.dart';

import '../models/ani_watch_model.dart';
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



  // ---------------------------- Watchlist Management ----------------------------

  // Add an anime to the watchlist

  Future<void> addToWatchList(AnimeModel anime) async {
    final currentAccount = activeAccount;
    if (currentAccount == null) return;

    await isar.writeTxn(() async {
      final existingAnime = await isar.animeModels.filter().idEqualTo(anime.id).findFirst();
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
      currentAccount.watchList.remove(anime);
      await currentAccount.watchList.save();

      final isStillLinked = await isar.accountModels.filter().watchList((q) => q.idEqualTo(anime.id)).count() > 0;

      if (!isStillLinked) {
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
  Future<void> addToWatchHistory({
    required AnimeModel animeModel,
    required Anime aniwatchAnime,
    required int watchTime,
    required int totalTime,
    required int watchedEpisodes,
    required int totalEpisodes,
  }) async {
    final account = activeAccount;
    if (account == null) return;

    final entry = WatchHistory(

    )
      ..watchTime = watchTime
      ..totalTime = totalTime
      ..watchedEpisodes = watchedEpisodes
      ..totalEpisodes = totalEpisodes
      ..anilistAnime.value = animeModel
      ..aniwatchAnime.value = aniwatchAnime;

    await isar.writeTxn(() async {
      await isar.watchHistorys.put(entry);
      await entry.anilistAnime.save();
      await entry.aniwatchAnime.save();

      account.watchHistory.add(entry);
      await account.watchHistory.save();
      await isar.accountModels.put(account);
    });

    await _reloadAccounts();
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
