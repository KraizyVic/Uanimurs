package com.example.uanimurs.data.models

// To parse the JSON, install kotlin's serialization plugin and do:
//
// val json          = Json { allowStructuredMapKeys = true }
// val episodeEntity = json.parse(EpisodeEntity.serializer(), jsonString)

import com.example.uanimurs.domain.entities.EpisodeEntity
import com.example.uanimurs.domain.entities.EpisodesEntity
import com.example.uanimurs.domain.entities.EpisodesResultsEntity
import kotlinx.serialization.*

@Serializable
data class EpisodesModel (
    val success: Boolean? = null,
    val results: EpisodesResultsModel? = null
)

fun EpisodesModel.toEpisodesEntity(): EpisodesEntity {
    return EpisodesEntity(
        success = success,
        results = results?.toEpisodesResultsEntity()
    )
}
fun EpisodesEntity.toEpisodesModel(): EpisodesModel{
    return EpisodesModel(
        success = success,
        results = results?.toEpisodeResultsModel()
    )
}

@Serializable
data class EpisodesResultsModel (
    val totalEpisodes: Long? = null,
    val episodes: List<EpisodeModel>? = null
)

fun EpisodesResultsModel.toEpisodesResultsEntity(): EpisodesResultsEntity{
    return EpisodesResultsEntity(
        totalEpisodes = totalEpisodes,
        episodes = episodes?.map { it.toEpisodeEntity() }
    )
}
fun EpisodesResultsEntity.toEpisodeResultsModel(): EpisodesResultsModel{
    return EpisodesResultsModel(
        totalEpisodes = totalEpisodes,
        episodes = episodes?.map { it.toEpisodeModel() }
    )
}

@Serializable
data class EpisodeModel (
    @SerialName("episode_no")
    val episodeNo: Long? = null,

    val id: String? = null,
    val title: String? = null,

    @SerialName("japanese_title")
    val japaneseTitle: String? = null,

    val filler: Boolean? = null
)

fun EpisodeModel.toEpisodeEntity(): EpisodeEntity{
    return EpisodeEntity(
        episodeNo = episodeNo,
        id = id,
        title = title,
        japaneseTitle = japaneseTitle,
        filler = filler
    )
}

fun EpisodeEntity.toEpisodeModel(): EpisodeModel{
    return EpisodeModel(
        episodeNo = episodeNo,
        id = id,
        title = title,
        japaneseTitle = japaneseTitle,
        filler = filler
    )
}
