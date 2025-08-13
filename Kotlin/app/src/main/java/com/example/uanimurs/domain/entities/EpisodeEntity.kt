package com.example.uanimurs.domain.entities

data class EpisodesEntity (
    val success: Boolean? = null,
    val results: EpisodesResultsEntity? = null
)

data class EpisodesResultsEntity (
    val totalEpisodes: Long? = null,
    val episodes: List<EpisodeEntity>? = null
)

data class EpisodeEntity (
    val episodeNo: Long? = null,
    val id: String? = null,
    val title: String? = null,
    val japaneseTitle: String? = null,
    val filler: Boolean? = null
)
