package com.example.uanimurs.presentation.custom_composables.home_composables

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil.compose.AsyncImage
import com.example.uanimurs.domain.entities.Spotlight

@Composable
fun SpotlightBanner(spotlightItem:Spotlight) {
    Surface(
        onClick = {},
        modifier = Modifier
            .width(380.dp)
    ) {
        AsyncImage(
            model = spotlightItem.poster,
            contentDescription = null,
            contentScale = ContentScale.Crop,
            modifier = Modifier
                .fillMaxWidth()
        )
        Box(
            modifier = Modifier
                .fillMaxSize()
                .background(
                    brush = Brush.linearGradient(
                        colors = listOf(
                            Color.Transparent,
                            MaterialTheme.colorScheme.surface
                        ),
                        start = Offset(0f,-1f),
                        end = Offset(0F, 1000f)
                    )
                ),
            content = {
                Column(
                    verticalArrangement = Arrangement.Bottom,
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(horizontal = 20.dp, vertical = 10.dp)
                ) {
                    Text(spotlightItem.title ?: "", maxLines = 2, overflow = TextOverflow.Ellipsis, fontWeight = FontWeight.Bold, fontSize = 20.sp, color = MaterialTheme.colorScheme.primary)
                    Spacer(modifier = Modifier.padding(5.dp))
                    Text(spotlightItem.description ?: "", maxLines = 3, overflow = TextOverflow.Ellipsis)
                }
            }
        )

    }

}