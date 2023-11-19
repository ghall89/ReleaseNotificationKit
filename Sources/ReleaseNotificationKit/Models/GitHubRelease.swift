import Foundation

public struct GitHubRelease: Codable {
	public var name: String
	public var html_url: String
	public var zipball_url: String
	public var body: String
	
	init(name: String, html_url: String, zipball_url: String, body: String) {
		self.name = name
		self.html_url = html_url
		self.zipball_url = zipball_url
		self.body = body
	}
}
