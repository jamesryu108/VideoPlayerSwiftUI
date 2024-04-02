//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		GeometryReader { geometry in
			VStack {
				VideoPlayerControlsView()
					.frame(height: geometry.size.height * 0.3) // 30% of the parent view's height
					.background(Color.blue)
				Spacer() // Use a Spacer to push the video player to the top
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
