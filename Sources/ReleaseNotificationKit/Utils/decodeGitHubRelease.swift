import Foundation

func decodeGitHubRelease(json: Data) -> GitHubRelease? {
	let decoder = JSONDecoder()
	do {
		let release = try decoder.decode([GitHubRelease].self, from: json)
		return release[0]
	} catch let error as NSError {
		print("Error decoding JSON: \(error.localizedDescription)")
	} catch {
		print("Unknown error decoding JSON")
	}
	return nil
}
