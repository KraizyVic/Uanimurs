package com.example.uanimurs.presentation.pages


import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.MailOutline
import androidx.compose.material3.Button
import androidx.compose.material3.CircularProgressIndicator
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.example.uanimurs.core.UiState
import com.example.uanimurs.presentation.custom_composables.home_composables.*
import com.example.uanimurs.presentation.state_management.HomePageViewModel
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomePage(modifier: Modifier = Modifier,homeViewModel: HomePageViewModel,navController: NavController) {
    val scrollState = rememberScrollState()
    when (val uiState = homeViewModel.homePageState) {
        is UiState.Loading -> {
            Box(
                modifier = Modifier
                    .fillMaxSize()
            ) {
                CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
            }
        }
        is UiState.Error -> {
            Column (
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.Center,
                modifier = Modifier
                    .fillMaxSize()

            ) {
                Text(uiState.message,)
                Button(
                    onClick = { homeViewModel.refreshHomePage() },
                ){
                    Text("Retry")
                }
            }
        }
        is UiState.Success -> {
            val data = uiState.data
            val pagerState = rememberPagerState{ data.results?.spotlights?.size ?: 0 }
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .verticalScroll(state = scrollState)
            ) {
                Box(
                    modifier = Modifier
                        .height(400.dp)
                        .fillMaxWidth()
                ) {
                    HorizontalPager(state = pagerState) { page ->
                        SpotlightBanner(
                            spotlightItem = data.results?.spotlights?.get(page)!!
                        )
                    }
                    TopAppBar(
                        colors = TopAppBarDefaults.topAppBarColors(
                            containerColor = Color.Transparent
                        ),
                        title = { Text("") },
                        actions = {
                            IconButton(
                                onClick = {},
                                content = { Icon(imageVector = Icons.Default.MailOutline, contentDescription = null, tint = Color.White,) }
                            )
                        }
                    )
                }
                Column() {
                    Text(
                        "Trending",
                        modifier = Modifier.padding(horizontal = 20.dp, vertical = 10.dp),
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Box(
                        modifier = Modifier
                            .height(220.dp)
                            .fillMaxWidth()
                    ) {
                        LazyRow(modifier = Modifier.fillMaxWidth()) {
                            items(data.results?.trending?.size ?: 0) {
                                HomeTrendingAnimeTile(
                                    modifier = Modifier.padding(
                                        start = 10.dp
                                    ),
                                    trending = data.results?.trending?.get(
                                        it
                                    )!!,
                                    navigationController = navController
                                )
                            }
                        }
                    }
                    Text(
                        "Top Airing",
                        modifier = Modifier.padding(horizontal = 20.dp, vertical = 10.dp),
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Box(
                        modifier = Modifier
                            .height(220.dp)
                            .fillMaxWidth()
                    ) {
                        LazyRow(modifier = Modifier.fillMaxWidth()) {
                            items(data.results?.topAiring?.size ?: 0) {
                                LatestCompletedTile(
                                    modifier = Modifier.padding(
                                        start = 10.dp
                                    ),
                                    latestCompleted = data.results?.topAiring?.get(
                                        it
                                    )!!,
                                    navigationController = navController
                                )
                            }
                        }
                    }
                    Text(
                        "Most popular",
                        modifier = Modifier.padding(horizontal = 20.dp, vertical = 10.dp),
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Box(
                        modifier = Modifier
                            .height(220.dp)
                            .fillMaxWidth()
                    ) {
                        LazyRow(modifier = Modifier.fillMaxWidth()) {
                            items(data.results?.mostPopular?.size ?: 0) {
                                LatestCompletedTile(
                                    modifier = Modifier.padding(
                                        start = 10.dp
                                    ),
                                    latestCompleted = data.results?.mostPopular?.get(
                                        it
                                    )!!,
                                    navigationController = navController
                                )
                            }
                        }
                    }
                    Text(
                        "Latest Completed",
                        modifier = Modifier.padding(horizontal = 20.dp, vertical = 10.dp),
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Box(
                        modifier = Modifier
                            .height(220.dp)
                            .fillMaxWidth()
                    ) {
                        LazyRow(modifier = Modifier.fillMaxWidth()) {
                            items(data.results?.latestCompleted?.size ?: 0) {
                                LatestCompletedTile(
                                    modifier = Modifier.padding(
                                        start = 10.dp
                                    ),
                                    latestCompleted = data.results?.latestCompleted?.get(
                                        it
                                    )!!,
                                    navigationController = navController
                                )
                            }
                        }
                    }
                }
                Box(modifier = modifier)
            }
        }
    }

}