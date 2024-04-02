//
//  VideoPlayerControlsView.swift
//  VideoPlayerSwiftUI
//
//  Created by James Ryu on 2024-04-02.
//

import AVKit
import SwiftUI

struct VideoPlayerControlsView: View {

	@State private var player = AVPlayer(url: URL(string: "https://example.com/video.mp4")!)
	@State private var isPlaying = false

	var body: some View {
		ZStack {
			AVPlayerView(player: player)
				.onAppear {
					player.pause() // Ensure the video is paused at the start
				}
		}
		.onDisappear {
			player.pause() // Pause the video when the view disappears
		}
	}
}
