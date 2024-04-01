//
//  VideoService.swift
//  VideoPlayerSwiftUI-production
//
//  Created by James Ryu on 2024-04-01.
//

import Foundation

/// Provides functionality to fetch and decode data for videos.
final class VideoService<T: Decodable> {
	/// The data provider to use for fetching data.
	private let dataProvider: DataProvider

	/// Initializes a new video service with the specified data provider.
	init(dataProvider: DataProvider) {
		self.dataProvider = dataProvider
	}

	/// Fetches and decodes video data.
	/// - Returns: The decoded data of the specified type.
	/// - Throws: An error if the data could not be fetched or decoded.
	func fetchData() async throws -> T {
		return try await dataProvider.fetchData()
	}
}
