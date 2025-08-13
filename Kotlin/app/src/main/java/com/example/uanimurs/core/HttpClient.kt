package com.example.uanimurs.core

import io.ktor.client.HttpClient
import io.ktor.client.engine.cio.CIO
import io.ktor.client.engine.cio.endpoint
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json

val httpClient = HttpClient(CIO){
    expectSuccess = true
    install(ContentNegotiation){
        json(
            Json {
                prettyPrint = true
                isLenient = true
                ignoreUnknownKeys = true
            }
        )
    }
    engine {
        // These are all in milliseconds
        requestTimeout = 60_000 // 60 seconds
        endpoint {
            connectTimeout = 60_000
            socketTimeout = 60_000
        }
    }
}