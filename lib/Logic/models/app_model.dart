import 'package:isar/isar.dart';
import 'package:uanimurs/Logic/models/settings_model.dart';

part 'app_model.g.dart';

@Collection()
class AppModel {
  Id id = 0;
  String appName ;
  String launchDate;
  final SettingsModel settings; // Embedded
  List<String> searchHistory = [];
  AppModel({
    required this.settings,
    this.searchHistory = const [],
    this.appName = "Uanimurs",
    this.launchDate = "2023-01-01",
  });

  AppModel copyWith({
    String? appName,
    String? appVersion,
    String? launchDate,
    SettingsModel? settings,
    List<String>? searchHistory,
  }){
    return AppModel(
      appName: appName ?? this.appName,
      launchDate: launchDate ?? this.launchDate,
      settings: settings ?? this.settings,
      searchHistory: searchHistory ?? this.searchHistory,
    );
  }
}