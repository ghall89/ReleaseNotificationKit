import XCTest
@testable import ReleaseNotificationKit

final class ReleaseNotificationKitTests: XCTestCase {
	func testCheckForUpdate() {
		checkForUpdate(path: "ghall89/QuestLogger", installedVersion: "0.1.0") { result in
			switch result {
				case .success(let release):
					if release != nil {
						print("Update available: \(release!.name)")
					} else {
						print("No update available")
					}
					
				case .failure(let error):
					// Handle the error
					print("Error: \(error)")
			}
		}
	}
}
