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

	func makeUIView(context: Context) -> UIView {
		return PlayerUIView(player: player)
	}

	func updateUIView(_ uiView: UIView, context: Context) {}
}

class PlayerUIView: UIView {
	private var playerLayer: AVPlayerLayer?

	init(player: AVPlayer) {
		super.init(frame: .zero)
		// Initialize the player layer and add it to the view's layer
		let playerLayer = AVPlayerLayer(player: player)
		self.layer.addSublayer(playerLayer)
		self.playerLayer = playerLayer
		playerLayer.videoGravity = .resizeAspect
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		// Ensure the player layer bounds match the UIView bounds
		playerLayer?.frame = self.bounds
	}
}
