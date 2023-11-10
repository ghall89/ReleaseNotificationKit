//
//  SwiftUIView.swift
//
//
//  Created by Graham Hall on 11/9/23.
//

import SwiftUI

struct UpdaterView: View {
	@AppStorage("lastCheckedVersion") var lastCheckedVersion: String = "v0.0.0"
	
	var bundleName: String
	var currentVersion: SemanticVersion
	var newVersion: SemanticVersion
	var downloadURL: URL
	var releaseNotes: String
	
	
	var body: some View {
		VStack {
			Text("A new version of \(bundleName) is available!")
				.font(.headline)
			Text("\(newVersion.string) (Current Version: \(currentVersion.string))")
			ScrollView {
				Text(releaseNotes)
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
		currentVersion: SemanticVersion("1.0.1"),
		newVersion: SemanticVersion("v1.2.1"),
		downloadURL: URL(string: "https://github.com/ghall89/ReleaseNotificationKit")!,
		releaseNotes: "Exercitation eu excepteur et minim sed cupidatat tempor laboris reprehenderit ullamco. Amet cillum nostrud cupidatat anim qui dolore dolor nisi sed nostrud dolore duis. Aliqua commodo sunt irure adipiscing est velit consequat est adipiscing fugiat est in lorem sit. Deserunt eu sunt laborum nostrud eiusmod sint nostrud excepteur mollit velit dolore consequat. Nulla cillum eiusmod ipsum ipsum magna et ad consectetur pariatur non deserunt incididunt excepteur amet et."
	)
}
