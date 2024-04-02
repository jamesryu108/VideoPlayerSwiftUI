//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

struct ContentView: View {
	
	init() {
		// Customize navigation bar appearance
		let appearance = UINavigationBarAppearance()
		appearance.configureWithOpaqueBackground()
		appearance.backgroundColor = UIColor.black // Set background color to black
		appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // Set title color to white
		appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] // Set large title color to white

		// Apply the appearance to all navigation bars
		UINavigationBar.appearance().standardAppearance = appearance
		UINavigationBar.appearance().compactAppearance = appearance // For smaller navigation bars
		UINavigationBar.appearance().scrollEdgeAppearance = appearance // For large titles
		UINavigationBar.appearance().tintColor = .white // Set the tint color for buttons
	}

	var body: some View {
		NavigationView {
			GeometryReader { geometry in
				VStack {
					VideoPlayerControlsView()
						.frame(height: geometry.size.height * 0.3) // 30% of the parent view's height
					Spacer() // Use a Spacer to push the video player to the top
				}
				.navigationBarTitle("Video Player", displayMode: .inline)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
