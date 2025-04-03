class AnimeModel {
  final int id;
  final int malId;
  final Date startDate;
  final Date endDate;
  final String season;
  final String type;
  final String format;
  final String status;
  final int episodes;
  final int duration;
  final bool isAdult;
  final int meanScore;
  final int popularity;
  final List<String> genres;
  final Trailer trailer;
  final Title title;
  final CoverImage coverImage;
  final String bannerImage;
  final String description;
  final Characters characters;
  AnimeModel({
    required this.id,
    required this.malId,
    required this.startDate,
    required this.endDate,
    required this.season,
    required this.type,
    required this.format,
    required this.status,
    required this.episodes,
    required this.duration,
    required this.isAdult,
    required this.meanScore,
    required this.popularity,
    required this.genres,
    required this.trailer,
    required this.title,
    required this.coverImage,
    required this.bannerImage,
    required this.description,
    required this.characters,
  });
  factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
    id: json["id"] ?? 0,
    malId: json["idMal"] ?? 0,
    startDate: json["startDate"] != null ? Date.fromJson(json["startDate"]) : Date(day: 0, month: 0, year: 0),
    endDate: json["endDate"] != null ? Date.fromJson(json["endDate"]) : Date(day: 0, month: 0, year: 0),
    season: json["season"] ?? "null",
    type: json["type"] ?? "null",
    format: json["format"] ?? "null",
    status: json["status"] ?? "null",
    episodes: json["episodes"] ?? 0,
    duration: json["duration"] ?? 0,
    isAdult: json["isAdult"] ?? false,
    meanScore: json["meanScore"] ?? 0,
    popularity: json["popularity"] ?? 0,
    genres: List<String>.from(json["genres"] ?? []), // Prevents `null.map()`
    trailer: json["trailer"] != null ? Trailer.fromJson(json["trailer"]) : Trailer(id: "null", site: "null", thumbnail: "null"),
    title: Title.fromJson(json["title"] ?? {}), // Default to empty map to avoid `null`
    coverImage: json["coverImage"] != null ? CoverImage.fromJson(json["coverImage"]) : CoverImage(large: "null", medium: "null", extraLarge: ''),
    bannerImage: json["bannerImage"] ?? "https://images6.alphacoders.com/127/thumb-1920-1276134.jpg",
    description: json["description"] ?? "No description",
    characters: json["characters"] != null ? Characters.fromJson(json["characters"]) : Characters(edges: []),
  );
}

class Characters {
  final List<AnimeEdge> edges;
  Characters({
    required this.edges,
  });
  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    edges: List<AnimeEdge>.from(json["edges"].map((x) => AnimeEdge.fromJson(x))),
  );
}

class AnimeEdge {
  final int? id;
  final String? name;
  final String role;
  final AnimeNode? node;
  final List<VoiceActor> voiceActors;
  AnimeEdge({
    required this.id,
    required this.name,
    required this.role,
    required this.node,
    required this.voiceActors,
  });
  factory AnimeEdge.fromJson(Map<String, dynamic> json) => AnimeEdge(
    id: json["id"],
    name: json["name"].toString(),
    role: json["role"] ?? "null",
    node: AnimeNode.fromJson(json["node"]),
    voiceActors: List<VoiceActor>.from(json["voiceActors"].map((x) => VoiceActor.fromJson(x))),
  );
}

class AnimeNode {
  final String? age;
  final Name name;
  final AnimeImage image;
  AnimeNode({
    required this.age,
    required this.name,
    required this.image,
  });
  factory AnimeNode.fromJson(Map<String, dynamic> json) => AnimeNode(
    age: json["age"],
    name: Name.fromJson(json["name"]),
    image: AnimeImage.fromJson(json["image"]),
  );
}

class AnimeImage {
  final String large;
  final String medium;
  AnimeImage({
    required this.large,
    required this.medium,
  });
  factory AnimeImage.fromJson(Map<String, dynamic> json) => AnimeImage(
    large: json["large"] ?? "null",
    medium: json["medium"] ?? "null",
  );
}

class Name {
  final String first;
  final String? last;
  Name({
    required this.first,
    required this.last,
  });
  factory Name.fromJson(Map<String, dynamic> json) => Name(
    first: json["first"] ?? "",
    last: json["last"] ?? "",
  );
}

class VoiceActor {
  final Name name;
  final AnimeImage image;
  VoiceActor({
    required this.name,
    required this.image,
  });
  factory VoiceActor.fromJson(Map<String, dynamic> json) => VoiceActor(
    name: Name.fromJson(json["name"]),
    image: AnimeImage.fromJson(json["image"]),
  );
}

class CoverImage {
  final String medium;
  final String large;
  final String extraLarge;
  CoverImage({
    required this.medium,
    required this.large,
    required this.extraLarge,
  });
  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
    medium: json["medium"] ?? "null",
    large: json["large"] ?? "null",
    extraLarge: json["extraLarge"] ?? "null",
  );
}

class Date {
  final int day;
  final int month;
  final int year;
  Date({
    required this.day,
    required this.month,
    required this.year,
  });
  factory Date.fromJson(Map<String, dynamic> json) => Date(
    day: json["day"] ?? 0,
    month: json["month"] ?? 0,
    year: json["year"] ?? 0,
  );
}

class Title {
  final String native;
  final String english;
  final String romaji;
  Title({
    required this.native,
    required this.english,
    required this.romaji,
  });
  factory Title.fromJson(Map<String, dynamic> json) => Title(
    native: json["native"] ?? "null",
    english: json["english"] ?? "null",
    romaji: json["romaji"] ?? "null",
  );
}

class Trailer {
  final String id;
  final String site;
  final String thumbnail;
  Trailer({
    required this.id,
    required this.site,
    required this.thumbnail,
  });
  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
    id: json["id"] ?? "null",
    site: json["site"] ?? "null",
    thumbnail: json["thumbnail"] ?? "null",
  );
}
