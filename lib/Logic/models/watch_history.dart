
import 'package:isar/isar.dart';

import 'ani_watch_model.dart';

part 'watch_history.g.dart';

@Collection()
class WatchHistory {
  Id id = Isar.autoIncrement;

  Anime? anime;
  String? name;
  String? image;
  int? anilistId;

  int? watchTime;
  int? totalTime;
  DateTime? lastWatched;
  StreamingLink? streamingLink;

  int? watchingEpisode;
  List<int>? watchedEpisodes;
  int? totalEpisodes;

  WatchHistory({
    this.anime,
    this.name,
    this.image,
    this.anilistId,
    this.watchTime,
    this.totalTime,
    this.lastWatched,
    this.streamingLink,
    this.watchingEpisode,
    this.watchedEpisodes,
    this.totalEpisodes,
  });
}
