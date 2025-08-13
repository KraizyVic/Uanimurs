package com.example.uanimurs.core

import com.example.uanimurs.data.data_source.online.AnimeDetailsService
import com.example.uanimurs.data.data_source.online.EpisodesService
import com.example.uanimurs.data.data_source.online.HomePageService
import com.example.uanimurs.data.repository_impls.AnimeDetailsRepositoryImpl
import com.example.uanimurs.data.repository_impls.EpisodesRepositoryImpl
import com.example.uanimurs.data.repository_impls.HomePageRepositoryImpl
import com.example.uanimurs.domain.repositories.AnimeDetailsRepository
import com.example.uanimurs.domain.repositories.EpisodesRepository
import com.example.uanimurs.domain.repositories.HomePageRepository
import com.example.uanimurs.domain.use_cases.FetchAnimeDetailsUseCase
import com.example.uanimurs.domain.use_cases.FetchEpisodesUseCase
import com.example.uanimurs.domain.use_cases.FetchHomePageUseCase
import com.example.uanimurs.presentation.state_management.AnimeDetailsPageViewModel
import com.example.uanimurs.presentation.state_management.EpisodesPageViewModel
import com.example.uanimurs.presentation.state_management.HomePageViewModel
import io.ktor.client.HttpClient
import org.koin.core.module.dsl.viewModel
import org.koin.dsl.module

val dataModule = module {
    single <HttpClient>{ httpClient}

    single <HomePageService>{ HomePageService(get<HttpClient>()) }
    single <AnimeDetailsService>{ AnimeDetailsService(get<HttpClient>()) }
    single <EpisodesService>{ EpisodesService(get<HttpClient>()) }

    single <HomePageRepository>{ HomePageRepositoryImpl(get<HomePageService>()) }
    single <AnimeDetailsRepository>{ AnimeDetailsRepositoryImpl(get<AnimeDetailsService>()) }
    single <EpisodesRepository>{ EpisodesRepositoryImpl(get<EpisodesService>()) }
}

val domainModule = module {
    single { FetchHomePageUseCase(get<HomePageRepository>()) }
    single { FetchAnimeDetailsUseCase(get<AnimeDetailsRepository>()) }
    single { FetchEpisodesUseCase(get<EpisodesRepository>()) }
}


val presentationModule = module {
    viewModel {
        HomePageViewModel(get<FetchHomePageUseCase>())
    }
    viewModel {
        AnimeDetailsPageViewModel(get<FetchAnimeDetailsUseCase>())
    }
    viewModel {
        EpisodesPageViewModel(get<FetchEpisodesUseCase>())
    }
}