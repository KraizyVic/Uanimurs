package com.example.uanimurs.domain.use_cases

import com.example.uanimurs.domain.entities.HomePageEntity
import com.example.uanimurs.domain.repositories.HomePageRepository

class FetchHomePageUseCase(
    private val homePageRepository: HomePageRepository
) {
    suspend fun call():HomePageEntity{
        return homePageRepository.fetchHomePage()
    }
}