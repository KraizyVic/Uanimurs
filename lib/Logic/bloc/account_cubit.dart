import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:uanimurs/Logic/models/account_model.dart';

import '../models/anime_model.dart';
import '../models/settings_model.dart';
import 'package:collection/collection.dart';

/*
class AccountCubit extends Cubit<List<AccountModel?>> {
  final Isar isar;

  AccountCubit(this.isar) : super([]) {
    loadAccount();
  }

  Future<void> checkForExistingAccounts() async {
    try {
      final accountCount = await isar.accountModels.count(); // Count the number of accounts

      if (accountCount > 0) {
        // If there are accounts, fetch all of them
        final accounts = await isar.accountModels.where().findAll();

        // Optionally, you can load data from the accounts (like watchlist, etc.)
        for (var account in accounts) {
          await account.watchList.load();
        }

        emit(accounts); // Emit the list of accounts
      } else {
        emit([]); // Emit empty list to indicate no accounts found
        print("No accounts found. Prompt the user to create or choose an account.");
      }
    } catch (e) {
      print('Error checking for accounts: $e');
    }
  }
  Future<void> _reloadAccount() async {
    final account = await isar.accountModels.where().findFirst();
    if (account != null) {
      await account.watchList.load();
      emit(account);
    }
  }

  Future<void> createAccount(
    String username,
    String? pfp, {
    SettingsModel? settings,
  }) async {
    print("createAccount called with username: $username");

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

      print("Account Created Successfully");

      emit(newAccount);
    } catch (e) {
      print('Error creating account: $e');
    }
  }

  // Anime Watchlist Methods with UI Handling

  Future<void> addToWatchList(AnimeModel anime) async {
    if (state == null) return;

    await isar.writeTxn(() async {
      // Check if anime already exists in DB
      final existingAnime = await isar.animeModels
          .filter()
          .idEqualTo(anime.id) // or .titleEqualTo(anime.title) if title is unique
          .findFirst();

      final animeToAdd = existingAnime ?? anime;

      if (existingAnime == null) {
        await isar.animeModels.put(anime); // Only add if not already saved
      }

      state!.watchList.add(animeToAdd);
      await state!.watchList.save();
    });

    await _reloadAccount();
  }

  Future<void> removeFromWatchList(AnimeModel anime) async {
    if (state == null) return;

    await isar.writeTxn(() async {
      state!.watchList.remove(anime);
      await state!.watchList.save();

      // Check if anime is still linked anywhere
      final isLinked = await isar.accountModels
          .filter()
          .watchList((q) => q.idEqualTo(anime.id))
          .count() > 0;

      if (!isLinked) {
        await isar.animeModels.delete(anime.id);  // Safe cleanup
      }
    });

    await _reloadAccount();
  }

  // Clear Watchlist
  Future<void> clearWatchList() async {
    if (state == null) return;

    await isar.writeTxn(() async {
      state!.watchList.clear();
      await state!.watchList.save();
    });

    emit(state);
  }


  // Update Any Setting (Smart & Reusable)
  Future<void> updateSettings(Function(SettingsModel settings) update) async {
    if (state == null) return;

    update(state!.settings);

    await isar.writeTxn(() async {
      await isar.accountModels.put(state!);
    });

    emit(state);
  }
}
*/

class AccountCubit extends Cubit<List<AccountModel>> {
  final Isar isar;

  AccountCubit(this.isar) : super([]) {
    _loadAccounts();
  }

  AccountModel? get activeAccount => state.firstWhereOrNull((acc) => acc.isActive);

  // ---------------------------- Account Management ----------------------------

  Future<void> createAccount(String username, String? pfp, {SettingsModel? settings}) async {
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

      await _reloadAccounts();
    } catch (e) {
      print('Error creating account: $e');
    }
  }

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

  // ---------------------------- Watchlist Management ----------------------------

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

  Future<void> removeFromWatchList(AnimeModel anime) async {
    final currentAccount = activeAccount;
    if (currentAccount == null) return;

    await isar.writeTxn(() async {
      currentAccount.watchList.remove(anime);
      await currentAccount.watchList.save();

      final isStillLinked = await isar.accountModels
          .filter()
          .watchList((q) => q.idEqualTo(anime.id))
          .count() > 0;

      if (!isStillLinked) {
        await isar.animeModels.delete(anime.id);
      }
    });

    await _reloadAccounts();
  }

  Future<void> clearWatchList() async {
    final currentAccount = activeAccount;
    if (currentAccount == null) return;

    await isar.writeTxn(() async {
      currentAccount.watchList.clear();
      await currentAccount.watchList.save();
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

  Future<void> updateSettings(void Function(SettingsModel settings) update) async {
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

