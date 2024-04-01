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

final class VideoService {

    private enum Constants {
        static let videosURLString = "http://localhost:4000/videos"
        static let isDebug: Bool = ((Bundle.main.infoDictionary?["isStaging"] as? Bool) ?? false) == true
    }

    private let session = URLSession.shared

    func fetchVideos() async throws -> [Video] {

		guard let videosURL = URL(string: Constants.videosURLString) else {
			throw VideoServiceError.invalidURL
		}

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        if Constants.isDebug {
			return SampleJSON.sampleData
        } else {
			//Fetch data from the API
			do {
				let (data, _) = try await session.data(from: videosURL)
				return try decoder.decode([Video].self, from: data)
			} catch {
				throw VideoServiceError.networkError(error)
			}
        }
    }
}
