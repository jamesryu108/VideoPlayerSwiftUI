//
//  ProductionDataProvider.swift
//  VideoPlayerSwiftUI
//
//  Created by James Ryu on 2024-04-01.
//

import Foundation

/// A data provider for the production environment, fetching data from a network URL.
struct ProductionDataProvider: DataProvider {
	let session = URLSession.shared
	let videosURL: URL

	init(videosURL: URL) {
		self.videosURL = videosURL
	}

	/// Fetches data from the network and decodes it into the specified type.
	/// - Throws: An error if the data could not be fetched or decoded.
	func fetchData<T>() async throws -> T where T: Decodable {
		do {
			let (data, _) = try await session.data(from: videosURL)
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .iso8601
			return try decoder.decode(T.self, from: data)
		} catch {
			throw VideoServiceError.networkError(error)
		}
	}
}
