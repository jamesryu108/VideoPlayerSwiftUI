//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

struct ContentView: View {

	private var debug: Bool = ((Bundle.main.infoDictionary?["isDebugMode"] as? String) ?? "FALSE") == "TRUE" ? true : false

    var body: some View {
        Text("Hello, world!")
            .padding()
			.onAppear {
				print("isDebug: \(debug)")
			}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
