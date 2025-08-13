package com.example.uanimurs.domain.entities


data class AnimeDetailsEntity(
    val success: Boolean? = null,
    val results: AnimeDetailsResults? = null
)

data class AnimeDetailsResults (
    val data: AnimeDetailsData? = null,
    val seasons: List<Season>? = null
)

data class AnimeDetailsData (
    val adultContent: Boolean? = null,
    val dataID: String? = null,
    val id: String? = null,
    val anilistID: String? = null,
    val malID: String? = null,
    val title: String? = null,
    val japaneseTitle: String? = null,
    val synonyms: String? = null,
    val poster: String? = null,
    val showType: String? = null,
    val animeInfo: AnimeInfo? = null,
    val charactersVoiceActors: List<CharactersVoiceActor>? = null,
    val recommendedData: List<EdDatum>? = null,
    val relatedData: List<EdDatum>? = null
)

data class AnimeInfo (
    val overview: String? = null,
    val japanese: String? = null,
    val synonyms: String? = null,
    val aired: String? = null,
    val premiered: String? = null,
    val duration: String? = null,
    val status: String? = null,
    val malScore: String? = null,
    val genres: List<String>? = null,
    val studios: String? = null,
    val producers: List<String>? = null,
    val trailers: List<Trailer>? = null,
    val tvInfo: AnimeInfoTvInfo? = null
)

data class Trailer (
    val title: String? = null,
    val url: String? = null,
    val thumbnail: String? = null
)

data class AnimeInfoTvInfo (
    val rating: String? = null,
    val quality: String? = null,
    val sub: String? = null,
    val dub: String? = null,
    val eps: String? = null,
    val showType: String? = null,
    val duration: String? = null
)
data class CharactersVoiceActor (
    val character: Character? = null,
    val voiceActors: List<Character>? = null
)

data class Character (
    val id: String? = null,
    val poster: String? = null,
    val name: String? = null,
    val cast: String? = null
)

data class EdDatum (
    val dataID: String? = null,
    val id: String? = null,
    val title: String? = null,
    val japaneseTitle: String? = null,
    val poster: String? = null,
    val tvInfo: RecommendedDatumTvInfo? = null,
    val adultContent: Boolean? = null
)

data class RecommendedDatumTvInfo (
    val showType: String? = null,
    val duration: String? = null,
    val sub: String? = null,
    val eps: String? = null,
    val dub: String? = null
)

data class Season (
    val id: String? = null,
    val dataNumber: Long? = null,
    val dataID: Long? = null,
    val season: String? = null,
    val title: String? = null,
    val seasonPoster: String? = null
)
