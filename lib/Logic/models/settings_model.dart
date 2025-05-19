import 'package:isar/isar.dart';

import '../../Database/constants.dart';

part 'settings_model.g.dart';

@embedded
class SettingsModel {
  late AppearanceSettings appearance;
  late GeneralSettings layout;
  late SubtitleSettings subtitles;
  late PlayerSettings player;

  // Constructor without nullable parameters
  SettingsModel({
    AppearanceSettings appearance = const AppearanceSettings(),
    GeneralSettings layout = const GeneralSettings(),
    SubtitleSettings subtitles = const SubtitleSettings(),
    PlayerSettings player = const PlayerSettings(),
  }) {
    this.appearance = appearance;
    this.layout = layout;
    this.subtitles = subtitles;
    this.player = player;
  }

  // CopyWith method for updating settings
  SettingsModel copyWith({
    AppearanceSettings? appearance,
    GeneralSettings? layout,
    SubtitleSettings? subtitles,
    PlayerSettings? player,
  }) {
    return SettingsModel(
      appearance: appearance ?? this.appearance,
      layout: layout ?? this.layout,
      subtitles: subtitles ?? this.subtitles,
      player: player ?? this.player,
    );
  }
}

@embedded
class AppearanceSettings {
  final int themeMode;
  final int primaryColor;
  final bool amoledBackground;
  final bool useMaterialUI;

  // Constructor with default values
  const AppearanceSettings({
    this.themeMode = 0,  // 0 = System, 1 = Light, 2 = Dark
    this.primaryColor = 0xFFFF9900, // Default Blue
    this.amoledBackground = false,
    this.useMaterialUI = true,
  });

  // CopyWith method
  AppearanceSettings copyWith({
    int? themeMode,
    int? primaryColor,
    bool? amoledBackground,
    bool? useMaterialUI,
  }) {
    return AppearanceSettings(
      themeMode: themeMode ?? this.themeMode,
      primaryColor: primaryColor ?? this.primaryColor,
      amoledBackground: amoledBackground ?? this.amoledBackground,
      useMaterialUI: useMaterialUI ?? this.useMaterialUI,
    );
  }
}

@embedded
class GeneralSettings {
  final int defaultServer;
  final int layoutType;
  // Constructor with default values
  const GeneralSettings({
    this.defaultServer = 0,  // 0 = Vidstreaming, 1 = Vidsrc
    this.layoutType = 0,  // 0 = GridView, 1 = ListView
  });

  // CopyWith method
  GeneralSettings copyWith({
    int? defaultServer,
    int? layoutType,
  }) {
    return GeneralSettings(
      defaultServer: defaultServer ?? this.defaultServer,
      layoutType: layoutType ?? this.layoutType,
    );
  }
}

@embedded
class SubtitleSettings {
  final int subtitleColor;
  final double fontSize;
  final double backgroundOpacity;

  // Constructor with default values
  const SubtitleSettings({
    this.subtitleColor = 0xFFFFFFFF, // White by default
    this.fontSize = 16.0,
    this.backgroundOpacity = 0.5,
  });

  // CopyWith method
  SubtitleSettings copyWith({
    int? subtitleColor,
    double? fontSize,
    double? backgroundOpacity,
  }) {
    return SubtitleSettings(
      subtitleColor: subtitleColor ?? this.subtitleColor,
      fontSize: fontSize ?? this.fontSize,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
    );
  }
}

@embedded
class PlayerSettings {
  final int skipDuration;
  final int megaSkipDuration;

  // Constructor with default values
  const PlayerSettings({
    this.skipDuration = 10,  // seconds
    this.megaSkipDuration = 60,  // seconds
  });

  // CopyWith method
  PlayerSettings copyWith({
    int? skipDuration,
    int? megaSkipDuration,
  }) {
    return PlayerSettings(
      skipDuration: skipDuration ?? this.skipDuration,
      megaSkipDuration: megaSkipDuration ?? this.megaSkipDuration,
    );
  }
}
