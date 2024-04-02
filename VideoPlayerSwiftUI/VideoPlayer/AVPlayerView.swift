//
//  AVPlayerView.swift
//  VideoPlayerSwiftUI
//
//  Created by James Ryu on 2024-04-02.
//

import AVKit
import SwiftUI
import UIKit

/// UIViewRepresentable wrapper for AVPlayer
struct AVPlayerView: UIViewRepresentable {
	var player: AVPlayer
	var key: UUID // Use this key to force updates

	func makeUIView(context: Context) -> UIView {
		PlayerUIView(player: player)
	}

	func updateUIView(_ uiView: UIView, context: Context) {
		if let playerUIView = uiView as? PlayerUIView {
			playerUIView.updatePlayer(player: player)
		}
	}
}

// PlayerUIView changes
class PlayerUIView: UIView {
	var playerLayer: AVPlayerLayer?

	init(player: AVPlayer) {
		super.init(frame: .zero)
		setupPlayerLayer(player: player)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func updatePlayer(player: AVPlayer) {
		playerLayer?.player = player
	}

	private func setupPlayerLayer(player: AVPlayer) {
		let playerLayer = AVPlayerLayer(player: player)
		self.layer.addSublayer(playerLayer)
		self.playerLayer = playerLayer
		playerLayer.videoGravity = .resizeAspect
		playerLayer.frame = self.bounds
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		playerLayer?.frame = self.bounds
	}
}
