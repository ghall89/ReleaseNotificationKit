import Foundation
import SwiftUI

struct Updater: App {
	@Environment(\.openWindow) var openWindow
	@State var oldVersion: SemanticVersion
	@State var newVersion: SemanticVersion
	@State var data: GitHubRelease
	
	init(oldVersion: SemanticVersion, newVersion: SemanticVersion, data: GitHubRelease) {
		fetchLatestRelease(path: "ghall89/QuestLogger") { result in
			switch result {
				case .success(let response):
					self.data = response
					self.oldVersion = SemanticVersion("1.0.1")
					self.newVersion = SemanticVersion(response.name)
					
					let isOutdated = checkIfOutdated(old: oldVersion, new: newVersion)
					if isOutdated {
						openWindow(id: "update-window")
					} else if isOutdated  {
						// show 'no new update' alert
					}
				case .failure(let error):
					print(error)
			}
		}
	}
	
	var body: some Scene {
		Window("Updater", id: "update-window") {
			UpdaterView(bundleName: "Test", currentVersion: oldVersion, newVersion: newVersion, downloadURL: URL(string: data.html_url)!, releaseNotes: data.body)
		}
	}
}

func checkIfOutdated(old: SemanticVersion, new: SemanticVersion) -> Bool {
	if old.major < new.major || old.minor < new.minor || old.patch < new.patch {
		return true
	} else {
		return false
	}
}
