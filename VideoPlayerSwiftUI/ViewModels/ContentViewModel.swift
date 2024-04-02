//
//  ContentViewModel.swift
//  VideoPlayerSwiftUI
//
//  Created by James Ryu on 2024-04-02.
//

import Foundation

final class ContentViewViewModel: ObservableObject {
	@Published var videoData: [Video]?
	private var videoService: VideoService<[Video]>

	init(dataProvider: DataProvider) {
		self.videoService = VideoService(dataProvider: dataProvider)
	}

	func fetchData() async {
		do {
			let data = try await videoService.fetchData()
			DispatchQueue.main.async {
				self.videoData = data
			}
		} catch {
			print(error)
		}
	}
}
