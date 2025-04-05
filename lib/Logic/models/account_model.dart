import 'package:isar/isar.dart';
import 'package:uanimurs/Logic/models/settings_model.dart';

import 'anime_model.dart';

part 'account_model.g.dart';

@Collection()
class AccountModel {
  Id id = Isar.autoIncrement;

  final String username;
  final String accountType;
  final String? pfp;

  final SettingsModel settings; // Embedded
  final IsarLinks<AnimeModel> watchList = IsarLinks<
      AnimeModel>(); // Relationship to AnimeModel List

  AccountModel({
    required this.username,
    this.accountType = "Local Account",
    this.pfp,
    required this.settings,
  });

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
/*
  extension AccountModelCopyWith on AccountModel {
  AccountModel copyWith({
    String? username,
    String? accountType,
    String? pfp,
    SettingsModel? settings,
    List<AnimeModel>? watchList,
  }) {
    return AccountModel(
      username: username ?? this.username,
      accountType: accountType ?? this.accountType,
      pfp: pfp ?? this.pfp,
      settings: settings ?? this.settings,
    )..watchList.addAll(watchList ?? this.watchList);
  }

}
*/