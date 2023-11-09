import Foundation

func fetchLatestRelease(path: String, completion: @escaping (Result<GitHubRelease, Error>) -> Void) {
	let url = URL(string: "https://api.github.com/repos/\(path)/releases")!
	print("Checking for update...")
	let task = URLSession.shared.dataTask(with: url) { data, response, error in
		if let data = data {
			print("Success!")
			if let releaseData = decodeGitHubRelease(json: data) {
				completion(.success(releaseData))
			} else {
				print("No data found...")
			}
		} else if let error = error {
			print("HTTP Request Failed \(error)")
			completion(.failure(error))
		}
	}
	
	task.resume()
	
}
