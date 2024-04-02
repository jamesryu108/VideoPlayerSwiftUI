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
		let view = UIView()
		let layer = AVPlayerLayer(player: player)
		layer.frame = view.bounds
		layer.videoGravity = .resizeAspect
		view.layer.addSublayer(layer)
		return view
	}

	func updateUIView(_ uiView: UIView, context: Context) {
	}
}
