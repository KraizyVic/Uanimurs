package com.example.uanimurs.presentation.custom_composables.home_composables

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.example.uanimurs.domain.entities.LatestCompleted
import com.example.uanimurs.domain.entities.Trending
import java.net.URLEncoder
import java.nio.charset.StandardCharsets

@Composable
fun HomeTrendingAnimeTile(modifier: Modifier = Modifier, trending: Trending,navigationController: NavController) {
    val encodedPosterUrl = URLEncoder.encode(trending.poster, StandardCharsets.UTF_8.toString())
    Column(
        modifier = modifier
            .width(120.dp)
            .clip(shape = RoundedCornerShape(15.dp))
            .clickable {
                navigationController.navigate("animeDetailsPage/${trending.id}/${trending.title}/${encodedPosterUrl}")
            }
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .weight(1f)
                .clip(shape = RoundedCornerShape(15.dp))
                .background(Color.Gray)


        ){
            AsyncImage(
                model = trending.poster,
                contentDescription = null,
                contentScale = ContentScale.Crop,
                modifier = Modifier
                    .fillMaxSize()
            )
            Row(
                horizontalArrangement = Arrangement.SpaceBetween,
                modifier = Modifier.fillMaxWidth()
            ) {
                Box(
                    modifier = Modifier
                        .clip(shape = RoundedCornerShape(bottomEnd = 10.dp))
                        .background(MaterialTheme.colorScheme.primary)
                ) {
                    Text(
                        trending.number ?: "",
                        textAlign = TextAlign.Center,
                        color = Color.Black,
                        modifier = Modifier.padding(5.dp)
                    )
                }
            }
        }
        Text("${trending.title}\n", maxLines = 2, overflow = TextOverflow.Ellipsis, textAlign = TextAlign.Center, modifier = Modifier.fillMaxWidth())
    }
}
@Composable
fun LatestCompletedTile(modifier: Modifier = Modifier, latestCompleted: LatestCompleted,navigationController: NavController) {
    val encodedPosterUrl = URLEncoder.encode(latestCompleted.poster, StandardCharsets.UTF_8.toString())
    Column(
        modifier = modifier
            .width(120.dp)
            .clip(shape = RoundedCornerShape(15.dp))
            .clickable {
                navigationController.navigate("animeDetailsPage/${latestCompleted.id}/${latestCompleted.title}/${encodedPosterUrl}")
            }
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .weight(1f)
                .clip(shape = RoundedCornerShape(15.dp))
                .background(Color.Gray)


        ){
            AsyncImage(
                model = latestCompleted.poster,
                contentDescription = null,
                contentScale = ContentScale.Crop,
                modifier = Modifier
                    .fillMaxSize()
            )
            Row(
                horizontalArrangement = Arrangement.SpaceBetween,
                modifier = Modifier.fillMaxWidth()
            ) {
                Box(){}
                Box(
                    modifier = Modifier
                        .clip(shape = RoundedCornerShape(bottomStart = 10.dp))
                        .background(MaterialTheme.colorScheme.primary),
                    content = {
                        Text(
                            latestCompleted.tvInfo?.showType ?: "",
                            textAlign = TextAlign.Center,
                            color = Color.Black,
                            modifier = Modifier.padding(5.dp)
                        )
                    }
                )
            }
        }
        Text("${latestCompleted.title}\n" ?: "", maxLines = 2, overflow = TextOverflow.Ellipsis)
    }
}