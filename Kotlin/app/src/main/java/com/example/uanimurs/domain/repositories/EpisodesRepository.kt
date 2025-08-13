package com.example.uanimurs.domain.repositories

import com.example.uanimurs.domain.entities.EpisodesEntity

interface EpisodesRepository {
    suspend fun fetchAnimeEpisodes(animeId: String): EpisodesEntity
}