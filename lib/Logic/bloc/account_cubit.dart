import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:uanimurs/Logic/models/account_model.dart';

import '../models/anime_model.dart';
import '../models/settings_model.dart';

class AccountCubit extends Cubit<AccountModel?> {
  final Isar isar;

  AccountCubit(this.isar) : super(null) {
    _loadAccount();
  }

  Future<void> _loadAccount() async {
    try {
      final account = await isar.accountModels.where().findFirst();
      if (account != null) {
        await account.watchList.load();
        emit(account);
      }
    } catch (e) {
      print('Error loading account: $e');
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
      state!.watchList.add(anime);
      await isar.accountModels.put(state!);
    });

    emit(state);
  }

  Future<void> removeFromWatchList(AnimeModel anime) async {
    if (state == null) return;

    await isar.writeTxn(() async {
      state!.watchList.remove(anime);
      await isar.accountModels.put(state!);
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
