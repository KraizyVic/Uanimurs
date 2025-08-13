package com.example.uanimurs.presentation.custom_composables.DetailsPageComposables

import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

@Composable
fun BorderInformation(modifier: Modifier = Modifier, info:String) {
    Box(
        modifier = Modifier
            .padding(start = 2.dp)
            .border(
                width = 1.dp,
                color = MaterialTheme.colorScheme.onSurface,
                shape = RoundedCornerShape(10.dp)
            ),
        content = {
            Text(
                info,
                style = MaterialTheme.typography.bodyMedium,
                modifier = Modifier.padding(horizontal = 8.dp, vertical = 4.dp),
            )
        }
    )
}