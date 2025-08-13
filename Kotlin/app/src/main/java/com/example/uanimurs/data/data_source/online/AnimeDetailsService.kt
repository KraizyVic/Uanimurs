package com.example.uanimurs.data.data_source.online

import com.example.uanimurs.data.models.AnimeDetailsModel
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.request.get

class AnimeDetailsService(
    private val httpClient: HttpClient
) {
    suspend fun fetchAnimeDetails(id: String): AnimeDetailsModel{
        try {
            val response: AnimeDetailsModel =
                httpClient.get("https://animeapi-two-mauve.vercel.app/api/info?id=$id").body()
            return response
        }catch (e:Exception){
            println("Error: $e")
            throw e
        }
    }
}