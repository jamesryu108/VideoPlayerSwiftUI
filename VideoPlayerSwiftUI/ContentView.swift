//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Text("Hello, world!")
            .padding()
			.onAppear {

				let dataProvider = StagingDataProvider()
				let videoService = VideoService<[Video]>(dataProvider: dataProvider)
				Task {
					let data = try await videoService.fetchData()
					print("data: \(data)")
				}
			}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
