// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "ReleaseNotificationKit",
		platforms: [
			.macOS(.v13),
		],
    products: [
        .library(
            name: "ReleaseNotificationKit",
            targets: ["ReleaseNotificationKit"]),
    ],
    targets: [
        .target(
            name: "ReleaseNotificationKit"),
        .testTarget(
            name: "ReleaseNotificationKitTests",
            dependencies: ["ReleaseNotificationKit"]),
    ]
)
