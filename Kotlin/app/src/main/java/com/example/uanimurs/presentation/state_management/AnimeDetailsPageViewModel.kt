package com.example.uanimurs.presentation.state_management

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.uanimurs.core.UiState
import com.example.uanimurs.domain.entities.AnimeDetailsEntity
import com.example.uanimurs.domain.use_cases.FetchAnimeDetailsUseCase
import kotlinx.coroutines.launch

class AnimeDetailsPageViewModel(
    private val fetchAnimeDetails: FetchAnimeDetailsUseCase
) : ViewModel() {
    var animeDetailsPageState by mutableStateOf<UiState<AnimeDetailsEntity>>(UiState.Loading)



    fun fetchAnimeDetails(id:String){
        viewModelScope.launch {
            animeDetailsPageState = UiState.Loading
            try {
                val result = fetchAnimeDetails.call(id)
                animeDetailsPageState = UiState.Success(result)
            } catch (e: Exception) {
                animeDetailsPageState = UiState.Error(e.message ?: "Something went wrong 😔")

            }
        }
    }

    fun reload(id: String){
        viewModelScope.launch {
            animeDetailsPageState = UiState.Loading
            try {
                val result = fetchAnimeDetails.call(id)
                animeDetailsPageState = UiState.Success(result)
            } catch (e: Exception) {
                animeDetailsPageState = UiState.Error(e.message ?: "Something went wrong 😔")
            }
        }
    }
}