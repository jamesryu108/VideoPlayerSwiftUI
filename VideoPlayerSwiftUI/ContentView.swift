//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import MarkdownKit
import SwiftUI

struct ContentView: View {

	private let markdownString = "This is **bold**, this is *italic*, and this is `code`."
	private let markdownParser = MarkdownParser()

	init() {
		customizeNavigationBar()
	}

	var body: some View {
		NavigationView {
			GeometryReader { geometry in
				LazyVStack(spacing: 0) {
					VideoPlayerControlsView()
						.frame(height: geometry.size.height * 0.3) // 30% of the parent view's height
					ScrollView {
						AttributedTextView(attributedString: markdownParser.parse(markdownString))
							.frame(height: geometry.size.height * 0.7)
							.border(Color.gray, width: 1) // Optional: Add a border for visibility
					}
				}
				.navigationBarTitle("Video Player", displayMode: .inline)
			}
		}
	}

	private func customizeNavigationBar() {
		// Customization logic moved here for clarity
		// Customize navigation bar appearance
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground()
		appearance.backgroundColor = UIColor.black // Set background color to black
		appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // Set title color to white
		appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] // Set large title color to white

		// Apply the appearance to all navigation bars
		UINavigationBar.appearance().standardAppearance = appearance
		UINavigationBar.appearance().compactAppearance = appearance // For smaller navigation bars
		UINavigationBar.appearance().scrollEdgeAppearance = appearance // For large titles
		UINavigationBar.appearance().tintColor = .white // Set the tint color for buttons
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
