package com.example.uanimurs.data.repository_impls

import com.example.uanimurs.data.data_source.online.HomePageService
import com.example.uanimurs.data.models.toEntity
import com.example.uanimurs.domain.entities.HomePageEntity
import com.example.uanimurs.domain.repositories.HomePageRepository

class HomePageRepositoryImpl(
    private val homePageDataSource: HomePageService
):HomePageRepository {
    override suspend fun fetchHomePage(): HomePageEntity {
        return homePageDataSource.fetchHomePage().toEntity()
    }
}