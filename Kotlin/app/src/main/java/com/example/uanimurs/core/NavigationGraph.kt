package com.example.uanimurs.core

import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.Menu
import androidx.compose.material.icons.filled.Person
import androidx.compose.material.icons.filled.Search
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.uanimurs.presentation.pages.AnimeDetailsPage
import com.example.uanimurs.presentation.pages.EpisodesPage
import com.example.uanimurs.presentation.pages.HomePage
import com.example.uanimurs.presentation.pages.MyListPage
import com.example.uanimurs.presentation.pages.ProfilePage
import com.example.uanimurs.presentation.pages.SearchPage
import com.example.uanimurs.presentation.state_management.AnimeDetailsPageViewModel
import com.example.uanimurs.presentation.state_management.HomePageViewModel
import java.net.URLDecoder
import java.nio.charset.StandardCharsets

sealed class BottomNavItem(val route: String, val icon: ImageVector, val label: String) {
    data object Home : BottomNavItem("homePage", Icons.Default.Home, "Home")
    data object Search : BottomNavItem("searchPage", Icons.Default.Search, "Search")
    data object MyList : BottomNavItem("myListPage", Icons.Default.Menu, "My list")
    data object Profile : BottomNavItem("profilePage", Icons.Default.Person, "Profile")
}

@Composable
fun NavigationCRAP(
    modifier: Modifier = Modifier,
    navController: NavHostController = rememberNavController(),
    innerPadding: PaddingValues,
    homePageViewModel: HomePageViewModel,
    animeDetailsPageViewModel: AnimeDetailsPageViewModel
) {
    NavHost(
        navController = navController,
        startDestination = BottomNavItem.Home.route,
    ) {
        composable(BottomNavItem.Home.route)  {
            HomePage(
                homeViewModel = homePageViewModel,
                modifier = Modifier.padding(innerPadding),
                navController = navController
            )
        }
        composable(BottomNavItem.Search.route) {
            SearchPage()
        }
        composable(BottomNavItem.MyList.route) {
            MyListPage()
        }
        composable(BottomNavItem.Profile.route) {
            ProfilePage()
        }
        composable("animeDetailsPage/{animeId}/{animeTitle}/{animePoster}") {
            val animeId = it.arguments?.getString("animeId").toString()
            val animeTitle = it.arguments?.getString("animeTitle").toString()
            val animePoster = URLDecoder.decode(it.arguments?.getString("animePoster"),StandardCharsets.UTF_8.toString())
            AnimeDetailsPage(id = animeId, title = animeTitle,poster = animePoster,navController = navController)
        }
        composable("episodesPage/{animeId}") {
            val animeId = it.arguments?.getString("animeId").toString()
            EpisodesPage(animeId = animeId, navController = navController)
        }
    }
}