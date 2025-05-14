
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:uanimurs/Logic/models/app_model.dart';

import '../models/settings_model.dart';

class AppCubit extends Cubit<AppModel?> {
  final Isar isar;

  AppCubit({required this.isar}) : super(null);

  Future<void> loadAppModel() async {
    final existing = await isar.appModels.get(0);
    if (existing != null) {
      emit(existing);
    } else {
      final initial = AppModel(settings: SettingsModel());
      await isar.writeTxn(() async {
        await isar.appModels.put(initial);
      });
      emit(initial);
    }
  }

  // ================== APPEARANCE SETTINGS ====================

  Future<void> updateSettings(
      SettingsModel Function(SettingsModel old) update,
      ) async {
    final old = state!;
    final newSettings = update(old.settings);
    final updatedAppModel = AppModel(
      appName: old.appName,
      launchDate: old.launchDate,
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
}

