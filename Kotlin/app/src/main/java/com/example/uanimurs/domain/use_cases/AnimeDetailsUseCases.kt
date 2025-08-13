package com.example.uanimurs.domain.use_cases

import com.example.uanimurs.domain.entities.AnimeDetailsEntity
import com.example.uanimurs.domain.repositories.AnimeDetailsRepository

class FetchAnimeDetailsUseCase(
    private val animeDetailsRepository: AnimeDetailsRepository
) {
    suspend fun call(id:String): AnimeDetailsEntity {
        return animeDetailsRepository.getAnimeDetails(id)
    }
}