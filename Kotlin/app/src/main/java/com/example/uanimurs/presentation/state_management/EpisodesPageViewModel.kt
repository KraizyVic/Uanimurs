package com.example.uanimurs.presentation.state_management

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.uanimurs.core.UiState
import com.example.uanimurs.domain.entities.EpisodesEntity
import com.example.uanimurs.domain.use_cases.FetchEpisodesUseCase
import kotlinx.coroutines.launch

class EpisodesPageViewModel(
    private val fetchEpisodesUseCase: FetchEpisodesUseCase
) : ViewModel() {
    var episodesPageState by mutableStateOf<UiState<EpisodesEntity>>(UiState.Loading)

    fun fetchEpisodes(animeId:String) {
        viewModelScope.launch {
            episodesPageState = UiState.Loading
            try {
                val result = fetchEpisodesUseCase.call(animeId = animeId)
                episodesPageState = UiState.Success(result)
            } catch (e: Exception) {
                episodesPageState = UiState.Error(e.message ?: "Something went wrong")
            }
        }
    }

    fun reloadEpisodes(animeId:String) {
        viewModelScope.launch {
            episodesPageState = UiState.Loading
            try {
                val result = fetchEpisodesUseCase.call(animeId = animeId)
                episodesPageState = UiState.Success(result)
            } catch (e: Exception) {
                episodesPageState = UiState.Error(e.message ?: "Something went wrong")
            }
        }
    }
}