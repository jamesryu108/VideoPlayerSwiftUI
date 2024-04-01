//
//  DataProvider.swift
//  VideoPlayerSwiftUI
//
//  Created by James Ryu on 2024-04-01.
//

import Foundation

protocol DataProvider {
	func fetchData<T: Decodable>() async throws -> T
}
