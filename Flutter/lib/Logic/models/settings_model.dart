import 'package:isar/isar.dart';

part 'settings_model.g.dart';

@embedded
class SettingsModel {
  late AppearanceSettings appearance;
  late GeneralSettings layout;
  late SubtitleSettings subtitles;
  late PlayerSettings player;

  // Constructor without nullable parameters
  SettingsModel({
    this.appearance = const AppearanceSettings(),
    this.layout = const GeneralSettings(),
    this.subtitles = const SubtitleSettings(),
    this.player = const PlayerSettings(),
  });

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
  final int defaultList;
  final int layoutType;
  // Constructor with default values
  const GeneralSettings({
    this.defaultServer = 0, // 0 = Vidstreaming, 1 = Vidsrc
    this.defaultList = 0,
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
  final double skipDuration;
  final double megaSkipDuration;
  final bool autoPlay;
  final bool skipItroOutro;

  // Constructor with default values
  const PlayerSettings({
    this.skipDuration = 0.1,  // seconds
    this.megaSkipDuration = 0.6,  // seconds
    this.autoPlay = false,
    this.skipItroOutro = false
  });

  // CopyWith method
  PlayerSettings copyWith({
    double? skipDuration,
    double? megaSkipDuration,
    bool? autoPlay,
    bool? skipItroOutro,
  }) {
    return PlayerSettings(
      skipDuration: skipDuration ?? this.skipDuration,
      megaSkipDuration: megaSkipDuration ?? this.megaSkipDuration,
      autoPlay: autoPlay ?? this.autoPlay,
      skipItroOutro: skipItroOutro ?? this.skipItroOutro,
    );
  }
}
