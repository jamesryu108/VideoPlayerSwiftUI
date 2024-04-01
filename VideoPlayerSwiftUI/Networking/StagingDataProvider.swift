//
//  StagingDataProvider.swift
//  VideoPlayerSwiftUI
//
//  Created by James Ryu on 2024-04-01.
//

import Foundation

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
