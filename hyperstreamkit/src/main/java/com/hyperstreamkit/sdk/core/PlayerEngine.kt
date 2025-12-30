package com.hyperstreamkit.sdk.core

import android.content.Context
import androidx.media3.common.MediaItem
import androidx.media3.exoplayer.ExoPlayer

class PlayerEngine(context: Context) {
    
    internal val exoPlayer: ExoPlayer = ExoPlayer.Builder(context).build()

    fun preparePlayer(videoUrl: String) {
        val mediaItem = MediaItem.fromUri(videoUrl)
        exoPlayer.setMediaItem(mediaItem)
        exoPlayer.playWhenReady = true
        exoPlayer.prepare()
    }

    fun releasePlayer() {
        exoPlayer.release()
    }
}