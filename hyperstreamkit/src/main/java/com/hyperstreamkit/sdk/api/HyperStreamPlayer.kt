package com.hyperstreamkit.sdk.api

import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.viewinterop.AndroidView
import androidx.media3.ui.PlayerView
import com.hyperstreamkit.sdk.core.PlayerEngine

@Composable
fun HyperStreamPlayer(
    modifier: Modifier = Modifier,
    videoUrl: String
) {
    val context = LocalContext.current
    
    val playerEngine = remember(videoUrl) {
        PlayerEngine(context).apply {
            preparePlayer(videoUrl)
        }
    }

    DisposableEffect(Unit) {
        onDispose {
            playerEngine.releasePlayer()
        }
    }
    
    AndroidView(
        factory = {
            PlayerView(it).apply {
                player = playerEngine.exoPlayer
                useController = true
            }
        },
        modifier = modifier
    )
}