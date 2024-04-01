//
//  VideoService.swift
//  VideoPlayerSwiftUI-production
//
//  Created by James Ryu on 2024-04-01.
//

import Foundation

enum VideoServiceError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

protocol ServiceConfiguration {
	var videosURL: URL? { get }
	var isStaging: Bool { get }
}

struct StagingConfiguration: ServiceConfiguration {
	var videosURL = URL(string: "http://localhost:4000/videos")
	var isStaging = true
}

struct ProductionConfiguration: ServiceConfiguration {
	var videosURL = URL(string: "http://localhost:4000/videos")
	var isStaging = false
}

final class VideoService<T: Decodable> {

    private let session = URLSession.shared
	private let configuration: ServiceConfiguration

	init(configuration: ServiceConfiguration) {
		self.configuration = configuration
	}

    func fetchData() async throws -> T {

		guard let videosURL = configuration.videosURL else {
			throw VideoServiceError.invalidURL
		}

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

		if configuration.isStaging {
			guard let sampleData = SampleJSON.sampleData as? T else {
				throw VideoServiceError.decodingError(
					NSError(
						domain: "",
						code: 0,
						userInfo: [NSLocalizedDescriptionKey: "Failed to cast sample data to the expected type"]
					)
				)
			}
			return sampleData
        } else {
			do {
				let (data, _) = try await session.data(from: videosURL)
				return try decoder.decode(T.self, from: data)
			} catch {
				throw VideoServiceError.networkError(error)
			}
        }
    }
}
