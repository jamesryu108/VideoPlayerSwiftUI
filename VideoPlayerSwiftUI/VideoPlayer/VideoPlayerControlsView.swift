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
	@State private var showControls = false

	var body: some View {
		ZStack {
			AVPlayerView(player: player)
				.onAppear {
					player.pause() // Ensure the video is paused at the start
				}
				.onDisappear {
					player.pause() // Pause the video when the view disappears
				}
				.onTapGesture {
					withAnimation {
						showControls.toggle() // Toggle the visibility of the controls
					}
				}

			// Overlay View
			if showControls {
				// Control buttons and gestures should be within the same overlay view to ensure proper layout and gesture recognition.
				overlayView
			}
		}
	}

	@ViewBuilder
	private var overlayView: some View {
		Color.black.opacity(0.4)
			.edgesIgnoringSafeArea(.all) // The overlay should extend to the edges of the screen
			.onTapGesture {
				withAnimation {
					showControls = false // Hide controls when the overlay is tapped
				}
			}
			.overlay(
				controlButtons // Place the control buttons on top of the translucent overlay
			)
	}

	@ViewBuilder
	private var controlButtons: some View {
		HStack(spacing: 40) {
			Button(action: previous) {
				controlButtonImage(name: "previous")
					.frame(width: 70, height: 70)
			}
			Button(action: togglePlayPause) {
				controlButtonImage(name: isPlaying ? "pause" : "play")
					.frame(width: 100, height: 100)
			}
			Button(action: forward) {
				controlButtonImage(name: "next")
					.frame(width: 70, height: 70)
			}
		}
		.foregroundColor(.white)
		.padding() // Provide some padding if necessary
	}

	private func controlButtonImage(name: String) -> some View {
		Image(name) // Replace with your own asset
			.resizable()
			.aspectRatio(contentMode: .fit)
			.padding(10) // Makes the tap area larger
			.background(
				Circle() // Create the circular background shape
					.fill(Color.gray.opacity(0.5)) // The grey circle background
					.overlay(
						Circle().stroke(Color.gray.opacity(0.8), lineWidth: 2) // Darker gray border
					)
			)
			.foregroundColor(.white)
	}

	private func togglePlayPause() {
		isPlaying.toggle()
		isPlaying ? player.play() : player.pause()
	}

	private func previous() {
		// Implementation for previous button
	}

	private func forward() {
		// Implementation for forward button
	}
}
