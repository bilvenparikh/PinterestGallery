//
//	User.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct User : Codable {

	let id : String?
	let links : Link?
	let name : String?
	let profileImage : ProfileImage?
	let username : String?


	enum CodingKeys: String, CodingKey {
		case id = "id"
		case links
		case name = "name"
		case profileImage
		case username = "username"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		links = try Link(from: decoder)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		profileImage = try ProfileImage(from: decoder)
		username = try values.decodeIfPresent(String.self, forKey: .username)
	}


}