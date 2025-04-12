import 'package:isar/isar.dart';
import 'package:uanimurs/Logic/models/ani_watch_model.dart';
import 'package:uanimurs/Logic/models/settings_model.dart';
import 'package:uanimurs/Logic/models/watch_history.dart';

import 'anime_model.dart';

part 'account_model.g.dart';

@Collection()
class AccountModel {
  Id id = Isar.autoIncrement;

  bool isActive = false;

  // Remove 'final' to allow reassignment
  String username;
  String accountType;

  String created = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

  // Remove 'late final' to allow reassignment
  String? pfp;

  final SettingsModel settings; // Embedded
  final IsarLinks<AnimeModel> watchList = IsarLinks<AnimeModel>(); // Relationship to AnimeModel List
  final IsarLinks<WatchHistory> watchHistory = IsarLinks<WatchHistory>(); // List of WatchHistoryModel
  final IsarLinks<AnimeModel> favorites = IsarLinks<AnimeModel>(); // Relationship to AnimeModel List
  final List<String> searchHistory = []; // List of search terms

  AccountModel({
    required this.username,
    this.accountType = "Local Account",
    this.pfp,
    required this.settings,
  });

  // Keep your copyWith method for creating new instances
  AccountModel copyWith({
    String? username,
    String? accountType,
    String? pfp,
    SettingsModel? settings,
  }) {
    return AccountModel(
      username: username ?? this.username,
      accountType: accountType ?? this.accountType,
      pfp: pfp ?? this.pfp,
      settings: settings ?? this.settings,
    );
  }
}
