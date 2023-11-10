import Foundation

struct SemanticVersion {
	var major: Int
	var minor: Int
	var patch: Int
	
	var string: String {
		return "v\(major).\(minor).\(patch)"
	}
	
	init(_ versionString: String) {
		let cleanVersionString = versionString.hasPrefix("v") ? String(versionString.dropFirst()) : versionString
		let versionComponents = cleanVersionString.components(separatedBy: ".")
		
		self.major = Int(versionComponents[0])!
		self.minor = Int(versionComponents[1])!
		self.patch = Int(versionComponents[2])!
	}
}
