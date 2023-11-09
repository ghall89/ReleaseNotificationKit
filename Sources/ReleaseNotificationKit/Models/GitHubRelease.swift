import Foundation

struct GitHubRelease: Codable {
	var name: String
	var html_url: String
	var zipball_url: String
	var body: String
}
