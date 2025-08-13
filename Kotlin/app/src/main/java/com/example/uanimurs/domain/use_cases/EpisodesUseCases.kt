package com.example.uanimurs.domain.use_cases

import com.example.uanimurs.domain.entities.EpisodesEntity
import com.example.uanimurs.domain.repositories.EpisodesRepository

class FetchEpisodesUseCase(
    private val episodesRepository: EpisodesRepository
) {
    suspend fun call(animeId: String) : EpisodesEntity{
        return episodesRepository.fetchAnimeEpisodes(animeId)
    }
}