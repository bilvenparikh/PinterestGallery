//
//	ProfileImage.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ProfileImage : Codable {

	let large : String?
	let medium : String?
	let small : String?


	enum CodingKeys: String, CodingKey {
		case large = "large"
		case medium = "medium"
		case small = "small"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		large = try values.decodeIfPresent(String.self, forKey: .large)
		medium = try values.decodeIfPresent(String.self, forKey: .medium)
		small = try values.decodeIfPresent(String.self, forKey: .small)
	}


}