//
//  VideoPlayerSwiftUIApp.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

@main
struct VideoPlayerSwiftUIApp: App {
    var body: some Scene {
		WindowGroup {
			ContentView(viewModel: ContentViewViewModel(dataProvider: resolveDataProvider()))
		}
    }
	func resolveDataProvider() -> DataProvider {
		let isStaging = (Bundle.main.infoDictionary?["isStaging"] as? Bool) ?? false
		if isStaging {
			return StagingDataProvider()
		} else {
			return ProductionDataProvider(videosURL: URL(string: "http://localhost:4000/videos")!)
		}
	}
}
