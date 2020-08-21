//
//	Category.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Category : Codable {

	let id : Int?
	let links : Link?
	let photoCount : Int?
	let title : String?


	enum CodingKeys: String, CodingKey {
		case id = "id"
		case links
		case photoCount = "photo_count"
		case title = "title"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		links = try Link(from: decoder)
		photoCount = try values.decodeIfPresent(Int.self, forKey: .photoCount)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}


}
