//
//  SwiftUIView.swift
//
//
//  Created by Graham Hall on 11/9/23.
//

import SwiftUI

public struct UpdaterView: View {
	@AppStorage("lastCheckedVersion") var lastCheckedVersion: String = "v0.0.0"
	
	var bundleName: String
	var newVersion: GitHubRelease
	
	public var body: some View {
		VStack {
			Text("A new version of \(bundleName) is available!")
				.font(.headline)
			Text("\(newVersion.name)")
			ScrollView {
				Text(newVersion.body)
					.padding(6)
			}
			.background(Color(NSColor.textBackgroundColor))
			.border(Color(NSColor.gridColor))
			
			HStack {
				Spacer()
				Button("Update Later...", action: {})
					.keyboardShortcut(.cancelAction)
				Button("Download", action: {})
					.keyboardShortcut(.defaultAction)
			}
		}
		.frame(width: 400, height: 240)
		.padding()
	}
}

#Preview {
	UpdaterView(
		bundleName: "My Cool App",
		newVersion: GitHubRelease(name: "v1.2.3", html_url: "https://github.com/ghall89/ReleaseNotificationKit", zipball_url: "https://github.com/ghall89/ReleaseNotificationKit", body: "Exercitation eu excepteur et minim sed cupidatat tempor laboris reprehenderit ullamco. Amet cillum nostrud cupidatat anim qui dolore dolor nisi sed nostrud dolore duis. Aliqua commodo sunt irure adipiscing est velit consequat est adipiscing fugiat est in lorem sit. Deserunt eu sunt laborum nostrud eiusmod sint nostrud excepteur mollit velit dolore consequat. Nulla cillum eiusmod ipsum ipsum magna et ad consectetur pariatur non deserunt incididunt excepteur amet et.")
	)
}
