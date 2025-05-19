
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/models/app_model.dart';
import 'package:uanimurs/Logic/models/watch_history.dart';

import '../models/settings_model.dart';

class AppCubit extends Cubit<AppModel?> {
  final Isar isar;

  AppCubit({required this.isar}) : super(null);

  // ========== INITIALIZATION ==========
  Future<void> loadAppModel() async {
    final existing = await isar.appModels.get(0);
    if (existing != null) {
      await existing.userList.load(); // 🧠 This line is KEY
      emit(existing);
    } else {
      final initial = AppModel(settings: SettingsModel());
      await isar.writeTxn(() async {
        await isar.appModels.put(initial);
      });
      emit(initial);
    }
  }
  Future<void> setNotFirstTime() async {
    final current = state!;
    final updated = current.copyWith(isFirstTime: false);

    await isar.writeTxn(() async {
      await isar.appModels.put(updated);
    });
    emit(updated);
  }

  // ========== APP FUNCTIONS ==========
  Future<void> authState({required bool isLoggedIn}) async {
    final current = state!;
    final updated = current.copyWith(isLoggedIn: isLoggedIn);
    await isar.writeTxn(() async {
      await isar.appModels.put(updated);
    });
    emit(updated);
  }
  Future<void> logout() async {
    final current = state!;
    final updated = current.copyWith(isLoggedIn: false);
    await isar.writeTxn(() async {
      await isar.appModels.put(updated);
    });
    emit(updated);
  }


  Future<AppModel> _getFreshAppModel() async {
    final model = await isar.appModels.get(0);
    await model!.userList.load();
    return model;
  }

  // ========== SETTINGS CORE ==========
  Future<void> updateSettings(
      SettingsModel Function(SettingsModel old) update,
      ) async {
    final old = state!;
    final newSettings = update(old.settings);
    final updated = old.copyWith(settings: newSettings);

    await isar.writeTxn(() async {
      await isar.appModels.put(updated);
    });
    emit(updated);
  }

  // ========== APPEARANCE ==========
  Future<void> updateThemeMode(int value) async {
    await updateSettings(
          (s) => s.copyWith(appearance: s.appearance.copyWith(themeMode: value)),
    );
  }

  Future<void> updateAmoledBackground(bool value) async {
    await updateSettings(
          (s) => s.copyWith(appearance: s.appearance.copyWith(amoledBackground: value)),
    );
  }

  Future<void> useMaterialUI(bool value) async {
    await updateSettings(
          (s) => s.copyWith(appearance: s.appearance.copyWith(useMaterialUI: value)),
    );
  }
  Future<void> updatePrimaryColor(int value) async {
    await updateSettings(
          (s) => s.copyWith(appearance: s.appearance.copyWith(primaryColor: value)),
    );
  }

  // ========== SEARCH HISTORY ==========
  Future<void> addSearchTerm(String term) async {
    final old = state!;
    if (term.trim().isEmpty || old.searchHistory.contains(term)) return;

    final updated = old.copyWith(
      searchHistory: [...old.searchHistory, term],
    );
    await isar.writeTxn(() async {
      await isar.appModels.put(updated);
    });
    emit(updated);
  }

  Future<void> clearSearchHistory() async {
    final old = state!;
    if (old.searchHistory.isEmpty) return;

    final updated = old.copyWith(searchHistory: []);
    await isar.writeTxn(() async {
      await isar.appModels.put(updated);
    });
    emit(updated);
  }

  Future<void> removeSearchTerm(String term) async {
    final old = state!;
    final updatedHistory = List<String>.from(old.searchHistory)..remove(term);
    final updated = old.copyWith(searchHistory: updatedHistory);

    await isar.writeTxn(() async {
      await isar.appModels.put(updated);
    });
    emit(updated);
  }

  // ========== WATCHLIST ==========
  Future<List<AnimeModel>> getWatchList() async {
    final model = state!;
    await model.userList.load();
    return model.userList.toList();
  }
  Future<bool> isInWatchList(AnimeModel anime) async {
    final model = await isar.appModels.get(0);
    await model!.userList.load();
    final list = model.userList.toList();
    return list.contains(anime);
  }

  Future<void> addToWatchList(AnimeModel anime) async {
    await isar.writeTxn(() async {
      await isar.animeModels.put(anime); // save anime
      //final managed = await isar.appModels.get(0); // ✅ now it's attached
      final managed = await _getFreshAppModel();
      managed.userList.add(anime);
      await managed.userList.save(); // ✅ safe now
      await managed.userList.load();

      emit(managed); // also emit the updated managed model
    });
  }

  Future<void> removeFromWatchList(AnimeModel item) async {
    await isar.writeTxn(() async {
      final managed = await _getFreshAppModel();
      managed.userList.remove(item);
      await managed.userList.save();
      await isar.animeModels.delete(item.id);
      await managed.userList.load();
      emit(managed);
    });
  }

  Future<void> clearWatchList() async {
    final model = state!;
    await model.userList.load();
    final all = model.userList.toList(); // now safely use it
    await isar.writeTxn(() async {
      for (var item in all) {
        await isar.animeModels.delete(item.id);
      }
      model.userList.clear();
      await model.userList.save();
      emit(model);
    });
  }

  // ========== FAVOURITES ==========
  Future<List<AnimeModel>> getFavorites() async {
    final model = state!;
    await model.favorites.load();
    return model.favorites.toList();
  }
  Future<void> addToFavorites(AnimeModel anime) async {
    final model = state!;
    await isar.writeTxn(() async {
        await isar.animeModels.put(anime); // save it first
        model.favorites.add(anime);
        await model.favorites.save();
        emit(state);
      }
    );
  }
  Future<void> removeFromFavorites(AnimeModel item) async {
    final model = state!;
    await isar.writeTxn(() async {
      model.favorites.remove(item);
      await model.favorites.save();
      await isar.animeModels.delete(item.id);
      emit(state);
      });
  }
  Future<void> clearFavorites() async {
    final model = state!;
    await model.favorites.load();
    final all = model.favorites.toList(); // now safely use it
    await isar.writeTxn(() async {
      for (var item in all) {
        await isar.animeModels.delete(item.id);
      }
      model.favorites.clear();
      await model.favorites.save();
      emit(model);
    });
  }

  // ========== WATCH HISTORY ==========
  Future<void> addToWatchHistory(WatchHistory history) async {
    final model = state!;
    await isar.writeTxn(() async {
      await isar.watchHistorys.put(history); // save it first
      model.watchHistory.add(history);
      await model.watchHistory.save();
    });
    emit(model);
  }

  Future<void> addOrUpdateWatchHistory(WatchHistory history) async {
    final model = state!;
    await model.watchHistory.load(); // Load linked entries

    // Find existing by anilistId
    WatchHistory? existing;
    try {
      existing = model.watchHistory.firstWhere(
            (h) => h.anilistId == history.anilistId,
      );
    } catch (_) {
      existing = null;
    }

    await isar.writeTxn(() async {
      if (existing != null) {
        // Update existing record
        final updated = existing.copyWith(
          watchingEpisode: history.watchingEpisode,
          watchTime: history.watchTime,
          totalTime: history.totalTime,
          lastWatched: DateTime.now(),
          streamingLink: history.streamingLink,
        );
        updated.id = existing.id; // Ensure ID remains the same
        await isar.watchHistorys.put(updated);
        // No need to re-link
      } else {
        // Add new record and link
        await isar.watchHistorys.put(history);
        model.watchHistory.add(history);
        await model.watchHistory.save();
      }
    });

    // 🔄 Reload after txn to update in-memory state
    await model.watchHistory.load();

    emit(model); // 📢 Emit AFTER changes
  }



  Future<List<WatchHistory>> getWatchHistory() async {
    final model = state!;
    await model.watchHistory.load();
    return model.watchHistory.toList();
  }

  Future<void> removeFromWatchHistory(WatchHistory item) async {
    await isar.writeTxn(() async {
      final managed = await _getFreshAppModel();
      managed.watchHistory.remove(item);
      await managed.watchHistory.save();
      await isar.watchHistorys.delete(item.id);
      await managed.watchHistory.load();
      emit(managed);
    });
  }

  Future<void> clearWatchHistory() async {
    final model = state!;
    await model.watchHistory.load();
    final all = model.watchHistory.toList(); // now safely use it

    await isar.writeTxn(() async {
      for (var item in all) {
        await isar.watchHistorys.delete(item.id);
      }
      model.watchHistory.clear();
      await model.watchHistory.save();
    });
    emit(model);
  }
}

/*

// ================== APPEARANCE SETTINGS ====================

  Future<void> updateSettings(
      SettingsModel Function(SettingsModel old) update,
      ) async {
    final old = state!;
    final newSettings = update(old.settings);
    final updatedAppModel = AppModel(
      settings: newSettings,
      searchHistory: old.searchHistory,
    );

    await isar.writeTxn(() async {
      await isar.appModels.put(updatedAppModel);
    });

    emit(updatedAppModel);
  }

  Future<void> updateThemeMode(int value) async {
    await updateSettings((settings) =>
        settings.copyWith(
          appearance: settings.appearance.copyWith(themeMode: value),
        ),
    );
  }
  Future<void> updateAmoledBackground(bool value) async {
    await updateSettings((settings) =>
      settings.copyWith(
        appearance: settings.appearance.copyWith(amoledBackground: value),
      ),
    );
  }
  Future<void> useMaterualU(bool value) async {
    await updateSettings((settings) =>
      settings.copyWith(
        appearance: settings.appearance.copyWith(useMaterialUI: value),
      ),
    );
  }
  Future<void> updatePrimaryColor(int value) async {
    await updateSettings((settings) =>
      settings.copyWith(
        appearance: settings.appearance.copyWith(primaryColor: value),
      ),
    );
  }

  // ================== SUBTITLE SETTINGS ====================

*/


