package com.example.uanimurs.presentation.pages

import androidx.activity.compose.BackHandler
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedCard
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.Placeable
import androidx.compose.ui.text.Placeholder
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.example.uanimurs.core.UiState
import com.example.uanimurs.presentation.custom_composables.episode_page_composables.EpisodeTile
import com.example.uanimurs.presentation.state_management.EpisodesPageViewModel
import org.koin.androidx.compose.koinViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EpisodesPage(
    modifier: Modifier = Modifier,
    animeId:String,
    navController: NavController,
    episodesPageViewModel: EpisodesPageViewModel = koinViewModel<EpisodesPageViewModel>()
) {

    val uiState = episodesPageViewModel.episodesPageState
    var textFieldValue by remember { mutableStateOf("") }

    LaunchedEffect(Unit) {
        episodesPageViewModel.fetchEpisodes(animeId = animeId)
    }
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Episodes") }
            )
        }
    ) { innerPadding ->
        Box(
            modifier = Modifier
                .fillMaxSize()
        ){
            when(uiState){
                is UiState.Loading -> {
                    CircularProgressIndicator(
                        modifier = Modifier
                            .align(Alignment.Center)
                    )
                }

                is UiState.Error -> {
                    Column(
                        modifier = Modifier
                            .align(Alignment.Center)
                    ) {
                        Text(text = "Error")
                        Text(text = uiState.message)
                    }
                }

                is UiState.Success -> {
                    Column(
                        modifier = Modifier
                            .fillMaxSize()
                            .padding(innerPadding)
                    ) {
                        if((uiState.data.results?.episodes?.size ?: 0) > 20){
                            OutlinedTextField(
                                value = textFieldValue,
                                onValueChange = {
                                    textFieldValue = it
                                },
                                placeholder = { Text("Enter Episode Number") },
                                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
                                singleLine = true,
                                shape = RoundedCornerShape(15.dp),
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(10.dp)
                            )
                        }
                        LazyColumn(
                            modifier = Modifier
                                .padding(horizontal = 10.dp)
                        ) {
                            items(uiState.data.results?.episodes?.size ?: 0) {
                                EpisodeTile(
                                    modifier = Modifier.padding(vertical = 8.dp),
                                    episodeEntity = uiState.data.results?.episodes?.get(it)
                                )
                                if (it != uiState.data.results?.episodes?.size?.minus(1)){
                                    HorizontalDivider(
                                        color = MaterialTheme.colorScheme.primary.copy(.2f),
                                        modifier = Modifier.padding(horizontal = 20.dp)
                                    )
                                }

                            }
                        }
                    }
                }
            }
        }


    }
}