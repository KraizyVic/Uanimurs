package com.example.uanimurs.presentation.state_management

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.uanimurs.core.UiState
import com.example.uanimurs.domain.entities.HomePageEntity
import com.example.uanimurs.domain.use_cases.FetchHomePageUseCase
import kotlinx.coroutines.launch

class HomePageViewModel(
    private val fetchHomePage: FetchHomePageUseCase
) : ViewModel() {

    var homePageState by mutableStateOf<UiState<HomePageEntity>>(UiState.Loading)
    init {
        fetchHomePage()
    }

    private fun fetchHomePage() {
        viewModelScope.launch {
            homePageState = UiState.Loading
            try {
                val result = fetchHomePage.call()
                homePageState = UiState.Success(result)
            } catch (e: Exception) {
                homePageState = UiState.Error(e.message ?: "Something went wrong 😔")
            }
        }
    }

    fun refreshHomePage() {
        viewModelScope.launch {
            homePageState = UiState.Loading
            try {
                val result = fetchHomePage.call()
                homePageState = UiState.Success(result)
            } catch (e: Exception) {
                homePageState = UiState.Error(e.message ?: "Something went wrong 😔")
            }
        }
    }
}
