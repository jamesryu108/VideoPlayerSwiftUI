//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import MarkdownKit
import SwiftUI

struct ContentView: View {

	@ObservedObject private var viewModel: ContentViewViewModel

	private let markdownParser = MarkdownParser()

	init(viewModel: ContentViewViewModel) {
		self.viewModel = viewModel
		customizeNavigationBar()
	}

	var body: some View {
		NavigationView {
			GeometryReader { geometry in
				LazyVStack(spacing: 0) {
					if let videoData = viewModel.videoData, !videoData.isEmpty {
						VideoPlayerControlsView(videoData: viewModel.videoData ?? [], currentIndex: $viewModel.currentVideoIndex) // Assumes currentIndex binding
							.frame(height: geometry.size.height * 0.3)
					}
					ScrollView {
						// Directly use viewModel.currentVideoMarkdown
						AttributedTextView(attributedString: markdownParser.parse(viewModel.currentVideoMarkdown))
							.frame(height: geometry.size.height * 0.7)
							.border(Color.gray, width: 1)
					}
				}
				.navigationBarTitle("Video Player", displayMode: .inline)
			}
		}
		.onAppear {
			Task {
				await viewModel.fetchData()
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
