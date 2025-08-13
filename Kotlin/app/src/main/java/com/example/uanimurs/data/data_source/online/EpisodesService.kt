package com.example.uanimurs.data.data_source.online

import com.example.uanimurs.data.models.EpisodesModel
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.request.get

class EpisodesService(
    private val httpClient: HttpClient,
) {
    suspend fun getEpisodes(animeId:String): EpisodesModel{
        try {
            val response : EpisodesModel = httpClient.get("https://animeapi-two-mauve.vercel.app/api/episodes/$animeId").body()
            return response
        } catch (e: Exception) {
            throw e
        }
    }
}