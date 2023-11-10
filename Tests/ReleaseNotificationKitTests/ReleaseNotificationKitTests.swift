import XCTest
@testable import ReleaseNotificationKit

final class ReleaseNotificationKitTests: XCTestCase {
	func testCheckForUpdate() {
		checkForUpdate(path: "ghall89/QuestLogger", installedVersion: "1.0", triggeredByUser: true)
	}
}
