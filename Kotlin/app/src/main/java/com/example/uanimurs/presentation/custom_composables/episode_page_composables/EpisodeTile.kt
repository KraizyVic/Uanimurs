package com.example.uanimurs.presentation.custom_composables.episode_page_composables

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.uanimurs.domain.entities.EpisodeEntity

@Composable
fun EpisodeTile(
    modifier: Modifier = Modifier,
    episodeEntity: EpisodeEntity?
) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = modifier
            .fillMaxWidth()
            .clip(shape = MaterialTheme.shapes.medium)
            //.background(Color.Blue)
            .padding(10.dp)

    ) {
        Text(episodeEntity?.episodeNo.toString(), fontSize = 30.sp, fontWeight = FontWeight.ExtraBold)
        Spacer(Modifier.width(15.dp))
        Text(episodeEntity?.title.toString(), style = MaterialTheme.typography.titleMedium)
    }
}