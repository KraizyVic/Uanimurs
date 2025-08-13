package com.example.uanimurs.data.repository_impls

import com.example.uanimurs.data.data_source.online.EpisodesService
import com.example.uanimurs.data.models.toEpisodesEntity
import com.example.uanimurs.domain.entities.EpisodesEntity
import com.example.uanimurs.domain.repositories.EpisodesRepository

class EpisodesRepositoryImpl(
    private val episodesService: EpisodesService
) : EpisodesRepository {
    override suspend fun fetchAnimeEpisodes(animeId: String): EpisodesEntity {
        return episodesService.getEpisodes(animeId = animeId).toEpisodesEntity()
    }
}