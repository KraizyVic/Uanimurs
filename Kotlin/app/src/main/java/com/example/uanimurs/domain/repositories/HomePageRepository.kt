package com.example.uanimurs.domain.repositories

import com.example.uanimurs.domain.entities.HomePageEntity

interface HomePageRepository {
    suspend fun fetchHomePage():HomePageEntity
}