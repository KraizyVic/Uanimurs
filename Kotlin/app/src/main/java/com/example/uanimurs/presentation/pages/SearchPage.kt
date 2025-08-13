package com.example.uanimurs.presentation.pages

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier

@Composable
fun SearchPage(modifier: Modifier = Modifier) {
    Box(modifier = Modifier.fillMaxSize()) {
        Text("Search Page",modifier = Modifier.align(Alignment.Center))
    }
}