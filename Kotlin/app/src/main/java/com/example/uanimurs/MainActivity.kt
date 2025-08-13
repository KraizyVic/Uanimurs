package com.example.uanimurs

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.Menu
import androidx.compose.material.icons.filled.Person
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material3.Icon
import androidx.compose.material3.NavigationBar
import androidx.compose.material3.NavigationBarItem
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.tooling.preview.Preview
import androidx.navigation.NavController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import com.example.uanimurs.core.BottomNavItem
import com.example.uanimurs.core.NavigationCRAP
import com.example.uanimurs.core.dataModule
import com.example.uanimurs.core.domainModule
import com.example.uanimurs.core.presentationModule
import com.example.uanimurs.presentation.pages.HomePage
import com.example.uanimurs.presentation.pages.MyListPage
import com.example.uanimurs.presentation.pages.ProfilePage
import com.example.uanimurs.presentation.pages.SearchPage
import com.example.uanimurs.presentation.state_management.AnimeDetailsPageViewModel
import com.example.uanimurs.presentation.state_management.HomePageViewModel
import com.example.uanimurs.ui.theme.UanimursTheme
import org.koin.android.ext.koin.androidContext
import org.koin.androidx.compose.koinViewModel
import org.koin.core.context.startKoin

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        startKoin {
            androidContext(this@MainActivity)
            modules(dataModule, domainModule, presentationModule)
        }
        setContent {
            UanimursTheme {
                MyApp()
            }
        }
    }
}

@Composable
fun MyApp(modifier: Modifier = Modifier) {
    val navController = rememberNavController()
    val homePageViewModel: HomePageViewModel = koinViewModel<HomePageViewModel>()
    val animeDetailsPageViewModel: AnimeDetailsPageViewModel = koinViewModel<AnimeDetailsPageViewModel>()
    val bottomNavRoutes = listOf("homePage","myListPage","searchPage","profilePage")
    Scaffold(
        bottomBar = {
            if (navController.currentBackStackEntryAsState().value?.destination?.route in bottomNavRoutes){
                BottomNavigationBar(navController)
            }
        },
        modifier = Modifier.fillMaxSize(),
    ) { innerPadding ->
        NavigationCRAP(
            modifier = Modifier.padding(innerPadding),
            navController = navController,
            innerPadding = innerPadding,
            homePageViewModel = homePageViewModel,
            animeDetailsPageViewModel = animeDetailsPageViewModel
        )
    }
}

@Composable
fun BottomNavigationBar(navController: NavController) {
    val items = listOf(
        BottomNavItem.Home,
        BottomNavItem.Search,
        BottomNavItem.MyList,
        BottomNavItem.Profile,
    )
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    val currentRoute = navBackStackEntry?.destination?.route

    NavigationBar { // Using Material 3 NavigationBar
        items.forEach { item ->
            NavigationBarItem(
                icon = { Icon(item.icon, contentDescription = item.label) },
                label = { Text(item.label) },
                selected = currentRoute == item.route, // Highlight selected tab
                onClick = {
                    // Navigate to the tab's route
                    navController.navigate(item.route) {
                        // Pop up to the start destination of the graph to avoid building up a large stack of destinations
                        popUpTo(navController.graph.startDestinationId) {
                            saveState = true // Save the state of the popped destinations
                        }
                        // Avoid multiple copies of the same destination when reselecting the same item
                        launchSingleTop = true
                        // Restore state when reselecting a previously selected item
                        restoreState = true
                    }
                }
            )
        }
    }
}
