package com.example.uanimurs.domain.repositories

import com.example.uanimurs.domain.entities.AnimeDetailsEntity

interface AnimeDetailsRepository {
    suspend fun getAnimeDetails(id: String): AnimeDetailsEntity
}