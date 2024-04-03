//
//  VideoPlayerControlsView.swift
//  VideoPlayerSwiftUI
//
//  Created by James Ryu on 2024-04-02.
//

import AVKit
import SwiftUI

struct VideoPlayerControlsView: View {

	var videoData: [Video]
	@State private var player: AVPlayer?
	@Binding var currentIndex: Int // Track the current video index
	@State private var isPlaying = false
	@State private var showControls = false
	@State private var playerKey: UUID = UUID() // Add this line

	init(videoData: [Video], currentIndex: Binding<Int>) {
		let sortedVideos = videoData.sorted { $0.publishedAt < $1.publishedAt }
		self.videoData = sortedVideos
		self._currentIndex = currentIndex
		// Load the first video URL into the player if available
		if let firstVideoUrl = sortedVideos.first?.hlsURL, let url = URL(string: firstVideoUrl) {
			_player = State(initialValue: AVPlayer(url: url))
		}
	}
	var body: some View {
		ZStack {
			if let player {
				AVPlayerView(player: player, key: playerKey)
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
			} else {
				Text("Unable to load video")
					.foregroundColor(.white)
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
		isPlaying ? player?.play() : player?.pause()
	}

	private func previous() {
		guard currentIndex > 0 else { return }
		currentIndex -= 1
		updatePlayerForCurrentIndex()
	}

	private func forward() {
		guard currentIndex < videoData.count - 1 else { return }
		currentIndex += 1
		updatePlayerForCurrentIndex()
	}

	private func updatePlayerForCurrentIndex() {
		// Ensure any current video playback is stopped.
		self.player?.pause()

		guard let url = URL(string: videoData[currentIndex].hlsURL) else { return }
		let newPlayer = AVPlayer(url: url)

		// Update the player with the new video.
		self.player = newPlayer

		// Since we're changing videos, reset the playback state.
		self.isPlaying = false

		// Update the unique key to force the AVPlayerView to refresh.
		self.playerKey = UUID()

		// Optionally, you can also immediately start playing the new video here.
		 newPlayer.play()
		 self.isPlaying = true
	}

}
