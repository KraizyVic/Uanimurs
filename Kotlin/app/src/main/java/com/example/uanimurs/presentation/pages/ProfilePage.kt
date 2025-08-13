package com.example.uanimurs.presentation.pages

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier

@Composable
fun ProfilePage(modifier: Modifier = Modifier) {
    Box(modifier = Modifier.fillMaxSize()) {
        Text("Profile Page",modifier = Modifier.align(Alignment.Center))
    }
}