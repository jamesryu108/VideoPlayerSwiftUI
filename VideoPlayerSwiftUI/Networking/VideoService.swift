//
//  VideoService.swift
//  VideoPlayerSwiftUI-production
//
//  Created by James Ryu on 2024-04-01.
//

import Foundation

/// Represents errors that can occur within the video service.
enum VideoServiceError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

protocol DataProvider {
	func fetchData<T: Decodable>() async throws -> T
}

/// A data provider for the staging environment, returning predefined sample data.
struct StagingDataProvider: DataProvider {
	/// Fetches predefined sample data.
	/// - Throws: An error if the sample data could not be cast to the expected type.
	func fetchData<T>() async throws -> T where T : Decodable {
		guard let sampleData = SampleJSON.sampleData as? T else {
			throw VideoServiceError.decodingError(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to cast sample data to the expected type"]))
		}
		return sampleData
	}
}

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
