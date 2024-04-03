//
//  ContentViewModel.swift
//  VideoPlayerSwiftUI
//
//  Created by James Ryu on 2024-04-02.
//

import Foundation

final class ContentViewViewModel: ObservableObject {
	@Published var videoData: [Video]?
	@Published var currentVideoMarkdown: String = ""
	var currentVideoIndex: Int = 0 {
		didSet {
			updateMarkdownForCurrentVideo()
		}
	}
	private var videoService: VideoService<[Video]>

	init(dataProvider: DataProvider) {
		self.videoService = VideoService(dataProvider: dataProvider)
	}

	func fetchData() async {
		do {
			let data = try await videoService.fetchData()
			DispatchQueue.main.async {
				self.videoData = data
				self.updateMarkdownForCurrentVideo()  // Ensure this is called here
			}
		} catch {
			print(error)
		}
	}


	func updateMarkdownForCurrentVideo() {
		guard let videoData = videoData, videoData.indices.contains(currentVideoIndex) else {
			currentVideoMarkdown = "No video data available"
			return
		}
		let video = videoData[currentVideoIndex]
		currentVideoMarkdown = video.description
	}
}
