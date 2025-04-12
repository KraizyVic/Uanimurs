
import 'package:isar/isar.dart';

import 'ani_watch_model.dart';
import 'anime_model.dart';

part 'watch_history.g.dart';

@Collection()
class WatchHistory {
  Id id = Isar.autoIncrement;

  int? watchTime;
  int? totalTime;

  final IsarLink<AnimeModel> anilistAnime = IsarLink<AnimeModel>();
  final IsarLink<Anime> aniwatchAnime = IsarLink<Anime>();

  int? watchedEpisodes;
  int? totalEpisodes;

  WatchHistory({
    this.watchTime,
    this.totalTime,
    this.watchedEpisodes,
    this.totalEpisodes,
  });
}