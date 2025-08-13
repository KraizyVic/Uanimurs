import 'package:isar/isar.dart';
import 'ani_watch_model.dart';

part 'watch_history.g.dart';

@Collection()
class WatchHistory {
  Id id = Isar.autoIncrement;

  int? supabaseId;
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
    this.supabaseId,
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

  WatchHistory copyWith({
    int? supabaseId,
    Anime? anime,
    String? name,
    String? image,
    int? anilistId,
    int? watchTime,
    int? totalTime,
    DateTime? lastWatched,
    StreamingLink? streamingLink,
    int? watchingEpisode,
    List<int>? watchedEpisodes,
    int? totalEpisodes,
  }){
    return WatchHistory(
      supabaseId: supabaseId ?? this.supabaseId,
      anime: anime ?? this.anime,
      name: name ?? this.name,
      image: image ?? this.image,
      anilistId: anilistId ?? this.anilistId,
      watchTime: watchTime ?? this.watchTime,
      totalTime: totalTime ?? this.totalTime,
      lastWatched: lastWatched ?? this.lastWatched,
      streamingLink: streamingLink ?? this.streamingLink,
      watchingEpisode: watchingEpisode ?? this.watchingEpisode,
      watchedEpisodes: watchedEpisodes ?? this.watchedEpisodes,
      totalEpisodes: totalEpisodes ?? this.totalEpisodes,
    );
  }

  factory WatchHistory.fromJson(Map<String, dynamic> json) => WatchHistory(
    supabaseId: json["id"],
    anime: json["anime"] == null ? null : Anime.fromJson(json["anime"]),
    name: json["name"],
    image: json["image"],
    anilistId: json["anilist_id"],
    watchTime: json["watch_time"],
    totalTime: json["total_time"],
    lastWatched: json["last_watched"] == null ? null : DateTime.parse(json["last_watched"]),
    streamingLink: json["streaming_link"] == null ? null : StreamingLink.fromJson(json["streaming_link"]),
    watchingEpisode: json["watching_episode"],
    watchedEpisodes: json["watched_episodes"] == null ? [] : List<int>.from(json["watched_episodes"].map((x) => x)),
    totalEpisodes: json["total_episodes"],
  );

  Map<String, dynamic> toJson(String userId) {
    return {
      "user_id": userId,
      "anime": anime?.toJson(),
      "name": name,
      "image": image,
      "anilist_id": anilistId,
      "watch_time": watchTime,
      "total_time": totalTime,
      "last_watched": lastWatched?.toIso8601String(),
      "streaming_link": streamingLink?.toJson(),
      "watching_episode": watchingEpisode,
      "watched_episodes": watchedEpisodes,
      "total_episodes": totalEpisodes,
    };
  }
}
