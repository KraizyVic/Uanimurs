package com.example.uanimurs.presentation.custom_composables.general_composables

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.unit.dp

@Composable
fun ListTile(
    modifier: Modifier = Modifier,
    title: String,
    subtitle: String = "",
    leading: @Composable () -> Unit = {},
    trailing: @Composable () -> Unit = {}
) {
    Row(
        modifier = Modifier
            .clip(MaterialTheme.shapes.medium)
            //.background(MaterialTheme.colorScheme.primary.copy(0.4f))
            .padding(16.dp)

    ) {
        leading()
        Spacer(modifier = Modifier.width(if (leading == {}) 0.dp else 10.dp))
        Column(
            modifier = Modifier.weight(1f)
        ) {
            Text(text = title,style = MaterialTheme.typography.titleMedium)
            if(subtitle != "") Text(text = subtitle,style = MaterialTheme.typography.bodyMedium)
        }
        trailing()
        Spacer(modifier = Modifier.width(if (trailing == {}) 0.dp else 10.dp))
    }
}