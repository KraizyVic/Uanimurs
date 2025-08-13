package com.example.uanimurs.data.data_source.online

import com.example.uanimurs.core.httpClient
import com.example.uanimurs.data.models.HomePageModel
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.request.get

class HomePageService(
    private val client: HttpClient
) {
    suspend fun fetchHomePage(): HomePageModel{
        try {
            val response : HomePageModel = client.get("https://animeapi-two-mauve.vercel.app/api").body()
            return response
        } catch (e: Exception) {
            println("Error: $e")
            throw e
        }
    }
}