//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct GalleryObject : Codable {

	let categories : [Category]?
	let color : String?
	let createdAt : String?
	let currentUserCollections : [String]?
	let height : Int?
	let id : String?
	let likedByUser : Bool?
	let likes : Int?
	let links : Link?
	let urls : Url?
	let user : User?
	let width : Int?


	enum CodingKeys: String, CodingKey {
		case categories = "categories"
		case color = "color"
		case createdAt = "created_at"
		case currentUserCollections = "current_user_collections"
		case height = "height"
		case id = "id"
		case likedByUser = "liked_by_user"
		case likes = "likes"
		case links
		case urls
		case user
		case width = "width"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		categories = try values.decodeIfPresent([Category].self, forKey: .categories)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		currentUserCollections = try values.decodeIfPresent([String].self, forKey: .currentUserCollections)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		likedByUser = try values.decodeIfPresent(Bool.self, forKey: .likedByUser)
		likes = try values.decodeIfPresent(Int.self, forKey: .likes)
		links = try values.decodeIfPresent(Link.self, forKey: .links)
		urls = try values.decodeIfPresent(Url.self, forKey: .urls)
		user = try User(from: decoder)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
	}


}
