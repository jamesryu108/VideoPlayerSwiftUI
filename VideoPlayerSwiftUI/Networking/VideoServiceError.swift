//
//  VideoServiceError.swift
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
