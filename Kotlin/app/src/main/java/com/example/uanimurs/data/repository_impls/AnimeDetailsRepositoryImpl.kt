package com.example.uanimurs.data.repository_impls

import com.example.uanimurs.data.data_source.online.AnimeDetailsService
import com.example.uanimurs.data.models.toAnimeDetailsEntity
import com.example.uanimurs.domain.entities.AnimeDetailsEntity
import com.example.uanimurs.domain.repositories.AnimeDetailsRepository

class AnimeDetailsRepositoryImpl(
    private val animeDetailsService: AnimeDetailsService
): AnimeDetailsRepository {
    override suspend fun getAnimeDetails(id: String): AnimeDetailsEntity {
        return animeDetailsService.fetchAnimeDetails(id).toAnimeDetailsEntity()
    }
}