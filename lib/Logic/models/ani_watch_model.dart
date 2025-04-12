import 'package:isar/isar.dart';

part 'ani_watch_model.g.dart';

// SEARCHED ANIME

class SearchedAnimes {
  final List<Anime> animes;
  final List<MostPopularAnime> mostPopularAnimes;
  final int currentPage;
  final bool hasNextPage;
  final int totalPages;
  final List<String> genres;

  SearchedAnimes({
    required this.animes,
    required this.mostPopularAnimes,
    required this.currentPage,
    required this.hasNextPage,
    required this.totalPages,
    required this.genres,
  });

  factory SearchedAnimes.fromJson(Map<String, dynamic> json) => SearchedAnimes(
    animes: List<Anime>.from(json["animes"].map((x) => Anime.fromJson(x))),
    mostPopularAnimes: List<MostPopularAnime>.from(json["mostPopularAnimes"].map((x) => MostPopularAnime.fromJson(x))),
    currentPage: json["currentPage"] ?? 0,
    hasNextPage: json["hasNextPage"] ?? false,
    totalPages: json["totalPages"] ?? 0,
    genres: List<String>.from(json["genres"].map((x) => x)),
  );
}

@Collection()
class Anime {
  Id id = Isar.autoIncrement;
  final String aniwatchId;
  final String name;
  final String img;
  final SearchedAnimeEpisodes episodes;
  final String duration;
  final bool rated;

  Anime({
    required this.aniwatchId,
    required this.name,
    required this.img,
    required this.episodes,
    required this.duration,
    required this.rated,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
    aniwatchId: json["id"] ?? "none",
    name: json["name"] ?? "none",
    img: json["img"] ?? "none",
    episodes: SearchedAnimeEpisodes.fromJson(json["episodes"]),
    duration: json["duration"] ?? "none",
    rated: json["rated"] ?? false,
  );
}

@Embedded()
class SearchedAnimeEpisodes {
  final int? eps;
  final int? sub;
  final int? dub;

  SearchedAnimeEpisodes({
    this.eps,
    this.sub,
    this.dub,
  });

  factory SearchedAnimeEpisodes.fromJson(Map<String, dynamic> json) => SearchedAnimeEpisodes(
    eps: json["eps"] ?? 0,
    sub: json["sub"] ?? 0,
    dub: json["dub"] ?? 0,
  );
}


class MostPopularAnime {
  final String id;
  final String name;
  final String category;
  final String img;
  final SearchedAnimeEpisodes episodes;

  MostPopularAnime({
    required this.id,
    required this.name,
    required this.category,
    required this.img,
    required this.episodes,
  });

  factory MostPopularAnime.fromJson(Map<String, dynamic> json) => MostPopularAnime(
    id: json["id"] ?? "none",
    name: json["name"] ?? "none",
    category: json["category"] ?? "none",
    img: json["img"] ?? "none",
    episodes: SearchedAnimeEpisodes.fromJson(json["episodes"]),
  );
}


// Episode list

class Episodes {
  final int totalEpisodes;
  final List<Episode> episodes;

  Episodes({
    required this.totalEpisodes,
    required this.episodes,
  });

  factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
    totalEpisodes: json["totalEpisodes"] ?? 0,
    episodes: List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
  );
}

class Episode {
  final String name;
  final int episodeNo;
  final String episodeId;
  final bool filler;

  Episode({
    required this.name,
    required this.episodeNo,
    required this.episodeId,
    required this.filler,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    name: json["name"] == null ? "" : json["name"],
    episodeNo: json["episodeNo"] == null ? 0 : json["episodeNo"],
    episodeId: json["episodeId"] == null ? "" : json["episodeId"],
    filler: json["filler"] == null ? false : json["filler"],
  );
}

// Servers (Dependant on Episode ID)

class Servers {
  final String episodeId;
  final int episodeNo;
  final List<Dub> sub;
  final List<Dub> dub;
  final List<dynamic> raw;

  Servers({
    required this.episodeId,
    required this.episodeNo,
    required this.sub,
    required this.dub,
    required this.raw,
  });

  factory Servers.fromJson(Map<String, dynamic> json) => Servers(
    episodeId: json["episodeId"],
    episodeNo: json["episodeNo"],
    sub: List<Dub>.from(json["sub"].map((x) => Dub.fromJson(x))),
    dub: List<Dub>.from(json["dub"].map((x) => Dub.fromJson(x))),
    raw: List<dynamic>.from(json["raw"].map((x) => x)),
  );
}

class Dub {
  final String serverName;
  final int serverId;

  Dub({
    required this.serverName,
    required this.serverId,
  });

  factory Dub.fromJson(Map<String, dynamic> json) => Dub(
    serverName: json["serverName"],
    serverId: json["serverId"],
  );
}

// Streaming Links

class StreamingLink {
  final List<Track> tracks;
  final Tro intro;
  final Tro outro;
  final List<Source> sources;
  final int anilistId;
  final int malId;

  StreamingLink({
    required this.tracks,
    required this.intro,
    required this.outro,
    required this.sources,
    required this.anilistId,
    required this.malId,
  });

  factory StreamingLink.fromJson(Map<String, dynamic> json) => StreamingLink(
    tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
    intro: Tro.fromJson(json["intro"]),
    outro: Tro.fromJson(json["outro"]),
    sources: List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
    anilistId: json["anilistID"],
    malId: json["malID"],
  );
}

class Tro {
  final int start;
  final int end;

  Tro({
    required this.start,
    required this.end,
  });

  factory Tro.fromJson(Map<String, dynamic> json) => Tro(
    start: json["start"],
    end: json["end"],
  );
}

class Source {
  final String url;
  final String type;

  Source({
    required this.url,
    required this.type,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    url: json["url"],
    type: json["type"],
  );
}

class Track {
  final String file;
  final String label;
  final String kind;
  final bool trackDefault;

  Track({
    required this.file,
    required this.label,
    required this.kind,
    required this.trackDefault,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    file: json["file"] ?? "none",
    label: json["label"] ?? "none",
    kind: json["kind"] ?? "none",
    trackDefault: json["default"] ?? false,
  );
}

class Subtitle {
  final int startTime;
  final int endTime;
  final String text;

  Subtitle({required this.startTime, required this.endTime, required this.text});
}

// M3U8 Quality

class M3U8Quality {
  final String quality;
  final String url;

  M3U8Quality({required this.quality, required this.url});

  // Factory constructor to create an instance from a Map
  factory M3U8Quality.fromMap(Map<String, String> map) {
    return M3U8Quality(
      quality: map['quality'] ?? "Unknown",
      url: map['url'] ?? "",
    );
  }
}
