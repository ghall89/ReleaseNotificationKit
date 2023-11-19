import Foundation

public func checkForUpdate(path: String, installedVersion: String, completion: @escaping (Result<GitHubRelease?, Error>) -> Void) {
	fetchLatestRelease(path: "ghall89/QuestLogger") { result in
		switch result {
			case .success(let response):
				let oldVersion = SemanticVersion(installedVersion)
				let newVersion = SemanticVersion(response.name)
				
				let isOutdated = checkIfOutdated(old: oldVersion, new: newVersion)
				
				if isOutdated {
					completion(.success(response))
				} else {
					completion(.success(nil))
				}
				
			case .failure(let error):
				print(error)
				completion(.failure(error))
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
