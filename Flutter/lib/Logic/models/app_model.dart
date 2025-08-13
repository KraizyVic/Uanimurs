import 'package:isar/isar.dart';
import 'package:uanimurs/Logic/models/anime_model.dart';
import 'package:uanimurs/Logic/models/settings_model.dart';
import 'package:uanimurs/Logic/models/watch_history.dart';

part 'app_model.g.dart';

@Collection()
class AppModel {
  Id id = 0;
  final bool isFirstTime;
  final bool isLoggedIn;
  final SettingsModel settings; // Embedded
  List<String> searchHistory = [];
  final IsarLinks<AnimeModel> userList = IsarLinks<AnimeModel>();
  final IsarLinks<WatchHistory> watchHistory = IsarLinks<WatchHistory>();
  final IsarLinks<AnimeModel> favorites = IsarLinks<AnimeModel>();
  AppModel({
    required this.settings,
    this.searchHistory = const [],
    this.isFirstTime = true,
    this.isLoggedIn = false,
  });

  AppModel copyWith({
    bool? isFirstTime,
    bool? isLoggedIn,
    SettingsModel? settings,
    List<String>? searchHistory,
  }) {
    final copy = AppModel(
      isFirstTime: isFirstTime ?? this.isFirstTime,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      settings: settings ?? this.settings,
      searchHistory: searchHistory ?? this.searchHistory,
    );
    // Re-attach links
    copy.userList.addAll(userList);
    copy.watchHistory.addAll(watchHistory);
    copy.favorites.addAll(favorites);

    return copy;
  }
}