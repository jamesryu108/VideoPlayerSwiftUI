//
//  AttributedTextView.swift
//  VideoPlayerSwiftUI-production
//
//  Created by James Ryu on 2024-04-02.
//

import SwiftUI

/// A SwiftUI view that wraps a UITextView to display NSAttributedString
struct AttributedTextView: UIViewRepresentable {
	var attributedString: NSAttributedString

	func makeUIView(context: Context) -> UITextView {
		let textView = UITextView()
		textView.isEditable = false // Make it read-only
		textView.isScrollEnabled = true // Enable scrolling
		return textView
	}

	func updateUIView(_ uiView: UITextView, context: Context) {
		uiView.attributedText = attributedString
	}
}
