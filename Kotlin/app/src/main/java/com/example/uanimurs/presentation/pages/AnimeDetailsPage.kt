package com.example.uanimurs.presentation.pages

import androidx.activity.compose.BackHandler
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AccessTime
import androidx.compose.material.icons.filled.Bookmark
import androidx.compose.material.icons.filled.FolderOpen
import androidx.compose.material.icons.filled.Star
import androidx.compose.material.icons.filled.StarBorder
import androidx.compose.material.icons.outlined.Bookmark
import androidx.compose.material.icons.outlined.Favorite
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.IconButtonDefaults
import androidx.compose.material3.LinearProgressIndicator
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.stylusHoverIcon
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.example.uanimurs.core.UiState
import com.example.uanimurs.domain.entities.AnimeDetailsEntity
import com.example.uanimurs.presentation.custom_composables.DetailsPageComposables.BorderInformation
import com.example.uanimurs.presentation.custom_composables.general_composables.ExpandableTile
import com.example.uanimurs.presentation.custom_composables.general_composables.ListTile
import com.example.uanimurs.presentation.state_management.AnimeDetailsPageViewModel
import org.koin.androidx.compose.koinViewModel

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AnimeDetailsPage(
    modifier: Modifier = Modifier,
    id:String,
    title:String,
    poster:String,
    animeDetailsPageViewModel: AnimeDetailsPageViewModel = koinViewModel<AnimeDetailsPageViewModel>(),
    navController: NavController
) {



    val uiState = animeDetailsPageViewModel.animeDetailsPageState
    val scrollState = rememberScrollState()
    var hasTrailer by remember { mutableStateOf(false) }
    var rating by remember { mutableStateOf("") }
    var showType by remember { mutableStateOf("") }
    var quality by remember { mutableStateOf("") }

    LaunchedEffect(Unit) {
        if (uiState !is UiState.Success) {
            animeDetailsPageViewModel.fetchAnimeDetails(id = id)
        }
    }
    Scaffold(
        topBar = {
            TopAppBar(
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = if (scrollState.value > 400) MaterialTheme.colorScheme.surface else Color.Transparent
                ),
                title = {},
                actions = {
                    IconButton(
                        onClick = {},
                        content = {
                            Icon(imageVector = Icons.Outlined.Favorite, contentDescription = "Add to List")
                        }
                    )
                    Spacer(modifier = Modifier.width(10.dp))
                }
            )
        }
    ) { innerPadding ->
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier
                .verticalScroll(
                    state = scrollState,
                )
        ) {
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(350.dp)
            ) {
                AsyncImage(
                    model = poster,
                    modifier = Modifier
                        .fillMaxSize(),
                    contentDescription = null,
                    contentScale = ContentScale.Crop
                )
                Box(
                    modifier = Modifier
                        .fillMaxSize()
                        .background(
                            brush = Brush.linearGradient(
                                colors = listOf(
                                    MaterialTheme.colorScheme.surface,
                                    MaterialTheme.colorScheme.surface.copy(alpha = 0.85f)
                                ),
                                start = Offset(0f, Float.POSITIVE_INFINITY),
                                end = Offset(0)
                            )
                        )
                ) {
                    Column(
                        verticalArrangement = Arrangement.Bottom,
                        modifier = Modifier.fillMaxSize().padding(horizontal = 16.dp)
                    ) {
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.End
                        ) {
                           Text(rating, color = MaterialTheme.colorScheme.primary.copy(0.8f),)
                            Text("·", modifier = Modifier.padding(horizontal = 5.dp), fontWeight = FontWeight.ExtraBold)
                            Text(showType, color = MaterialTheme.colorScheme.primary.copy(0.8f),)
                            Text("·", modifier = Modifier.padding(horizontal = 5.dp), fontWeight = FontWeight.ExtraBold)
                            Text(quality, color = MaterialTheme.colorScheme.primary.copy(0.8f),)
                        }
                        Row(
                            horizontalArrangement = Arrangement.SpaceBetween,
                            verticalAlignment = Alignment.CenterVertically,
                            modifier = Modifier
                                .fillMaxWidth()
                            //.background(color = MaterialTheme.colorScheme.primary)
                        ) {
                            AsyncImage(
                                model = poster,
                                contentDescription = null,
                                contentScale = ContentScale.Crop,
                                modifier = Modifier
                                    .height(160.dp)
                                    .width(110.dp)
                                    .clip(shape = RoundedCornerShape(10.dp))
                            )
                            Spacer(modifier = Modifier.width(16.dp))
                            Column(
                                Modifier.height(160.dp),
                                verticalArrangement = Arrangement.Bottom
                            ) {
                                Text(
                                    text = title,
                                    style = MaterialTheme.typography.titleLarge,
                                    overflow = TextOverflow.Ellipsis,

                                    )
                                Spacer(modifier = Modifier.height(8.dp))
                                Row(
                                    verticalAlignment = Alignment.CenterVertically,
                                    modifier = Modifier.fillMaxWidth()
                                ) {
                                    TextButton(
                                        onClick = {},
                                        colors = ButtonDefaults.textButtonColors(),
                                        modifier = Modifier.weight(1f)
                                    ) {
                                        Text(text = "Continue")
                                    }
                                    Spacer(modifier = Modifier.width(8.dp))
                                    TextButton(
                                        onClick = {},
                                        colors = ButtonDefaults.textButtonColors(
                                            containerColor = MaterialTheme.colorScheme.primary,
                                            contentColor = MaterialTheme.colorScheme.onPrimary
                                        ),
                                        modifier = Modifier.weight(1f)
                                    ) {
                                        Text(text = "Play")
                                    }
                                    Spacer(modifier = Modifier.width(8.dp))

                                }
                            }
                        }
                    }
                }
            }
            Spacer(modifier = Modifier.height(16.dp))
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 10.dp, horizontal = 10.dp),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Button(
                    onClick = {},
                    enabled = hasTrailer,
                    shape = RoundedCornerShape(10.dp),
                    contentPadding = PaddingValues(0.dp),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = Color(0xFFCD201F),
                        contentColor = MaterialTheme.colorScheme.tertiary
                    ),
                    content = {
                        Text(text = "Trailer")
                    },
                    modifier = Modifier.weight(1f)
                )
                Spacer(modifier = Modifier.width(10.dp))
                Button(
                    shape = RoundedCornerShape(10.dp),
                    contentPadding = PaddingValues(0.dp),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = MaterialTheme.colorScheme.primary,
                        contentColor = MaterialTheme.colorScheme.onPrimary
                    ),
                    enabled = false,
                    onClick = {},
                    content = {
                        Text(text = "List")
                    },
                    modifier = Modifier.weight(1f)
                )
                Spacer(modifier = Modifier.width(10.dp))
                Button(
                    onClick = {
                        navController.navigate("episodesPage/$id")
                    },
                    shape = RoundedCornerShape(10.dp),
                    contentPadding = PaddingValues(0.dp),
                    content = {
                        Text(text = "Episodes")
                    },
                    modifier = Modifier.weight(1f)
                )
            }
            when (uiState) {
                is UiState.Loading -> {
                    LinearProgressIndicator()
                }

                is UiState.Error -> {
                    Column {
                        Text(text = "Error")
                        Text(text = uiState.message)
                    }
                }
                is UiState.Success -> {
                    rating = uiState.data.results?.data?.animeInfo?.tvInfo?.rating ?: ""
                    showType = uiState.data.results?.data?.animeInfo?.tvInfo?.showType ?: ""
                    quality = uiState.data.results?.data?.animeInfo?.tvInfo?.quality ?: ""
                    hasTrailer = uiState.data.results?.data?.animeInfo?.trailers?.isNotEmpty() ?: false
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(horizontal = 10.dp)
                    ){

                        Text("Genres", style = MaterialTheme.typography.titleMedium)
                        LazyRow(
                            modifier = Modifier.padding(vertical = 10.dp)
                        ) {
                            items(uiState.data.results?.data?.animeInfo?.genres?.size ?: 0) {
                                BorderInformation(info = uiState.data.results?.data?.animeInfo?.genres?.get(it) ?: "")
                                Spacer(modifier = Modifier.width(5.dp))
                            }
                        }

                        ExpandableTile(
                            title = "Overview",
                            modifier = Modifier.padding(vertical = 10.dp),
                            content = {
                                Text(text = uiState.data.results?.data?.animeInfo?.overview ?: "", modifier = Modifier.padding(15.dp))
                            }
                        )

                        ListTile(
                            title = "Episodes",
                            leading = {
                                Icon(
                                    imageVector = Icons.Default.FolderOpen,
                                    contentDescription = "Duration"
                                )
                            },
                            trailing = {
                                Text(text = uiState.data.results?.data?.animeInfo?.tvInfo?.sub ?: "")
                            }
                        )
                        ListTile(
                            title = "Rating",
                            leading = {
                                Icon(
                                    imageVector = Icons.Filled.StarBorder,
                                    contentDescription = "star"
                                )
                            },
                            trailing = { Text(uiState.data.results?.data?.animeInfo?.malScore ?: "") }
                        )

                        ListTile(
                            title = "Duration",
                            leading = {
                                Icon(
                                    imageVector = Icons.Default.AccessTime,
                                    contentDescription = "Duration"
                                )
                            },
                            trailing = {
                                Text(text = uiState.data.results?.data?.animeInfo?.duration ?: "")
                            }
                        )
                        ListTile(
                            title = "Premiered",
                            subtitle = uiState.data.results?.data?.animeInfo?.premiered ?: "",
                        )
                        ListTile(
                            title = "Aired",
                            subtitle = uiState.data.results?.data?.animeInfo?.aired ?: "",
                        )
                        ListTile(
                            title = "Status",
                            subtitle = uiState.data.results?.data?.animeInfo?.status ?: "",
                        )
                        OutlinedTextField(
                            value = "",
                            onValueChange = {}
                        )
                    }
                }
            }
            Box(modifier = Modifier.padding(innerPadding))
        }
    }
}