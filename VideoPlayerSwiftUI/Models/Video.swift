//
//  Video.swift
//  VideoPlayerSwiftUI
//
//  Created by James Ryu on 2024-03-31.
//

import Foundation

/// `Video` represents a video content entity with associated metadata.
/// It conforms to `Codable` for easy encoding and decoding from and to JSON,
struct Video: Codable, Identifiable {
    let id: String
    let title: String
    let hlsURL: String
    let fullURL: String
    let description: String
    let publishedAt: String
    let author: Author
}

/// `Author` represents the creator of the video content.
struct Author: Codable, Identifiable {
    let id: String
    let name: String
}
