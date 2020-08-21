//
//	Link.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Link : Codable {

	let photos : String?
	let selfImage : String?
	let download : String?
	let html : String?


	enum CodingKeys: String, CodingKey {
		case photos = "photos"
		case selfImage = "self"
		case download = "download"
		case html = "html"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		photos = try values.decodeIfPresent(String.self, forKey: .photos)
		selfImage = try values.decodeIfPresent(String.self, forKey: .selfImage)
		download = try values.decodeIfPresent(String.self, forKey: .download)
		html = try values.decodeIfPresent(String.self, forKey: .html)
	}


}
