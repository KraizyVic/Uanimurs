package com.example.uanimurs.data.models

import com.example.uanimurs.domain.entities.AnimeDetailsData
import com.example.uanimurs.domain.entities.AnimeDetailsEntity
import com.example.uanimurs.domain.entities.AnimeDetailsResults
import com.example.uanimurs.domain.entities.AnimeInfo
import com.example.uanimurs.domain.entities.AnimeInfoTvInfo
import com.example.uanimurs.domain.entities.Character
import com.example.uanimurs.domain.entities.CharactersVoiceActor
import com.example.uanimurs.domain.entities.EdDatum
import com.example.uanimurs.domain.entities.RecommendedDatumTvInfo
import com.example.uanimurs.domain.entities.Season
import com.example.uanimurs.domain.entities.Trailer
import kotlinx.serialization.*

// === ANIME DETAILS MODEL
@Serializable
data class AnimeDetailsModel (
    val success: Boolean? = null,
    val results: AnimeDetailsResultsModel? = null
)
fun AnimeDetailsModel.toAnimeDetailsEntity(): AnimeDetailsEntity {
    return AnimeDetailsEntity(
        success = success,
        results = results?.toAnimeDetailsResults()
    )
}
fun AnimeDetailsEntity.toAnimeDetailsModel(): AnimeDetailsModel{
    return AnimeDetailsModel(
        success = success,
        results = results?.toAnimeDetailsResultsModel()
    )
}


// === ANIME DETAILS PAGE RESULTS MODEL ===
@Serializable
data class AnimeDetailsResultsModel (
    val data: AnimeDetailsDataModel? = null,
    val seasons: List<SeasonModel>? = null
)
fun AnimeDetailsResultsModel.toAnimeDetailsResults(): AnimeDetailsResults {
    return AnimeDetailsResults(
        data = data?.toAnimeDetailsData(),
        seasons = seasons?.map { it.toSeason() }
    )
}
fun AnimeDetailsResults.toAnimeDetailsResultsModel(): AnimeDetailsResultsModel{
    return AnimeDetailsResultsModel(
        data = data?.toAnimeDetailsDataModel(),
        seasons = seasons?.map { it.toSeasonModel() }
    )
}

@Serializable
data class AnimeDetailsDataModel (
    val adultContent: Boolean? = null,

    @SerialName("data_id")
    val dataID: String? = null,

    val id: String? = null,

    @SerialName("anilistId")
    val anilistID: String? = null,

    @SerialName("malId")
    val malID: String? = null,

    val title: String? = null,

    @SerialName("japanese_title")
    val japaneseTitle: String? = null,

    val synonyms: String? = null,
    val poster: String? = null,
    val showType: String? = null,
    val animeInfo: AnimeInfoModel? = null,
    val charactersVoiceActors: List<CharactersVoiceActorModel>? = null,

    @SerialName("recommended_data")
    val recommendedData: List<EdDatumModel>? = null,

    @SerialName("related_data")
    val relatedData: List<EdDatumModel>? = null
)
fun AnimeDetailsDataModel.toAnimeDetailsData(): AnimeDetailsData{
    return AnimeDetailsData(
        adultContent = adultContent,
        dataID = dataID,
        id = id,
        anilistID = anilistID,
        malID = malID,
        title = title,
        japaneseTitle = japaneseTitle,
        synonyms = synonyms,
        poster = poster,
        showType = showType,
        animeInfo = animeInfo?.toAnimeInfo(),
        charactersVoiceActors = charactersVoiceActors?.map { it.toCharactersVoiceActor() },
        recommendedData = recommendedData?.map { it.toEdDatum() },
        relatedData = relatedData?.map { it.toEdDatum() }
    )
}
fun AnimeDetailsData.toAnimeDetailsDataModel(): AnimeDetailsDataModel{
    return AnimeDetailsDataModel(
        adultContent = adultContent,
        dataID = dataID,
        id = id,
        anilistID = anilistID,
        malID = malID,
        title = title,
        japaneseTitle = japaneseTitle,
        synonyms = synonyms,
        poster = poster,
        showType = showType,
        animeInfo = animeInfo?.toAnimeInfoModel(),
        charactersVoiceActors = charactersVoiceActors?.map { it.toCharactersVoiceActorModel() },
        recommendedData = recommendedData?.map { it.toEdDatumModel() },
        relatedData = relatedData?.map { it.toEdDatumModel() }
    )
}

// === ANIME INFO MODEL ===
@Serializable
data class AnimeInfoModel (
    @SerialName("Overview")
    val overview: String? = null,

    @SerialName("Japanese")
    val japanese: String? = null,

    @SerialName("Synonyms")
    val synonyms: String? = null,

    @SerialName("Aired")
    val aired: String? = null,

    @SerialName("Premiered")
    val premiered: String? = null,

    @SerialName("Duration")
    val duration: String? = null,

    @SerialName("Status")
    val status: String? = null,

    @SerialName("MAL Score")
    val malScore: String? = null,

    @SerialName("Genres")
    val genres: List<String>? = null,

    @SerialName("Studios")
    val studios: String? = null,

    @SerialName("Producers")
    val producers: List<String>? = null,

    val trailers: List<TrailerModel>? = null,
    val tvInfo: AnimeInfoTvInfoModel? = null
)
fun AnimeInfoModel.toAnimeInfo(): AnimeInfo {
    return AnimeInfo(
        overview = overview,
        japanese = japanese,
        synonyms = synonyms,
        aired = aired,
        premiered = premiered,
        duration = duration,
        status = status,
        malScore = malScore,
        genres = genres,
        studios = studios,
        producers = producers,
        trailers = trailers?.map { it.toTrailer() },
        tvInfo = tvInfo?.toAnimeInfoTvInfo()
    )
}
fun AnimeInfo.toAnimeInfoModel(): AnimeInfoModel{
    return AnimeInfoModel(
        overview = overview,
        japanese = japanese,
        synonyms = synonyms,
        aired = aired,
        premiered = premiered,
        duration = duration,
        status = status,
        malScore = malScore,
        genres = genres,
        studios = studios,
        producers = producers,
        trailers = trailers?.map { it.toTrailerModel() },
        tvInfo = tvInfo?.toAnimeInfoTvInfoModel()
    )
}


// === TRAILER MODEL ===
@Serializable
data class TrailerModel (
    val title: String? = null,
    val url: String? = null,
    val thumbnail: String? = null
)
fun TrailerModel.toTrailer(): Trailer {
    return Trailer(
        title = title,
        url = url,
        thumbnail = thumbnail
    )
}
fun Trailer.toTrailerModel(): TrailerModel{
    return TrailerModel(
        title = title,
        url = url,
        thumbnail = thumbnail
    )
}

// === ANIME INFO TV INFO MODEL ===
@Serializable
data class AnimeInfoTvInfoModel (
    val rating: String? = null,
    val quality: String? = null,
    val sub: String? = null,
    val dub: String? = null,
    val eps: String? = null,
    val showType: String? = null,
    val duration: String? = null
)
fun AnimeInfoTvInfoModel.toAnimeInfoTvInfo(): AnimeInfoTvInfo{
    return AnimeInfoTvInfo(
        rating = rating,
        quality = quality,
        sub = sub,
        dub = dub,
        eps = eps,
        showType = showType,
        duration = duration
    )
}
fun AnimeInfoTvInfo.toAnimeInfoTvInfoModel(): AnimeInfoTvInfoModel{
    return AnimeInfoTvInfoModel(
        rating = rating,
        quality = quality,
        sub = sub,
        dub = dub,
        eps = eps,
        showType = showType,
        duration = duration
    )
}

// === CHARACTERS VOICE ACTOR MODEL ===
@Serializable
data class CharactersVoiceActorModel (
    val character: CharacterModel? = null,
    val voiceActors: List<CharacterModel>? = null
)
fun CharactersVoiceActorModel.toCharactersVoiceActor(): CharactersVoiceActor {
    return CharactersVoiceActor(
        character = character?.toCharacter(),
        voiceActors = voiceActors?.map { it.toCharacter() }
    )
}
fun CharactersVoiceActor.toCharactersVoiceActorModel(): CharactersVoiceActorModel{
    return CharactersVoiceActorModel(
        character = character?.toCharacterModel(),
        voiceActors = voiceActors?.map { it.toCharacterModel() }
    )
}

// === CHARACTER MODEL ===
@Serializable
data class CharacterModel (
    val id: String? = null,
    val poster: String? = null,
    val name: String? = null,
    val cast: String? = null
)
fun CharacterModel.toCharacter(): Character {
    return Character(
        id = id,
        poster = poster,
        name = name,
        cast = cast
    )
}
fun Character.toCharacterModel(): CharacterModel{
    return CharacterModel(
        id = id,
        poster = poster,
        name = name,
        cast = cast
    )
}

// === ED DATUM MODEL ===
@Serializable
data class EdDatumModel (
    @SerialName("data_id")
    val dataID: String? = null,

    val id: String? = null,
    val title: String? = null,

    @SerialName("japanese_title")
    val japaneseTitle: String? = null,

    val poster: String? = null,
    val tvInfo: RecommendedDatumTvInfoModel? = null,
    val adultContent: Boolean? = null
)
fun EdDatumModel.toEdDatum(): EdDatum {
    return EdDatum(
        dataID = dataID,
        id = id,
        title = title,
        japaneseTitle = japaneseTitle,
        poster = poster,
        tvInfo = tvInfo?.toRecommendedDatumTvInfo(),
        adultContent = adultContent
    )
}
fun EdDatum.toEdDatumModel(): EdDatumModel{
    return EdDatumModel(
        dataID = dataID,
        id = id,
        title = title,
        japaneseTitle = japaneseTitle,
        poster = poster,
        tvInfo = tvInfo?.toRecommendedDatumTvInfoModel(),
        adultContent = adultContent,
    )
}

// ==== RECOMMENDED DATUM TV INFO MODEL ===
@Serializable
data class RecommendedDatumTvInfoModel (
    val showType: String? = null,
    val duration: String? = null,
    val sub: String? = null,
    val eps: String? = null,
    val dub: String? = null
)
fun RecommendedDatumTvInfoModel.toRecommendedDatumTvInfo(): RecommendedDatumTvInfo{
    return RecommendedDatumTvInfo(
        showType = showType,
        duration = duration,
        sub = sub,
        eps = eps,
        dub = dub
    )
}
fun RecommendedDatumTvInfo.toRecommendedDatumTvInfoModel(): RecommendedDatumTvInfoModel{
    return RecommendedDatumTvInfoModel(
        showType = showType,
        duration = duration,
        sub = sub,
        eps = eps,
        dub = dub
    )
}

// === SEASON MODEL ===
@Serializable
data class SeasonModel (
    val id: String? = null,

    @SerialName("data_number")
    val dataNumber: Long? = null,

    @SerialName("data_id")
    val dataID: Long? = null,

    val season: String? = null,
    val title: String? = null,

    @SerialName("season_poster")
    val seasonPoster: String? = null
)

fun SeasonModel.toSeason(): Season {
    return Season(
        id = id,
        dataNumber = dataNumber,
        dataID = dataID,
        season = season,
        title = title,
        seasonPoster = seasonPoster
    )
}
fun Season.toSeasonModel(): SeasonModel{
    return SeasonModel(
        id = id,
        dataNumber = dataNumber,
        dataID = dataID,
        season = season,
        title = title,
        seasonPoster = seasonPoster
    )
}
