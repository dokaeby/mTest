//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//
//	Owner.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Owner : Codable {

	let avatarUrl : String?
	let gravatarId : String?
	let id : Int?
	let login : String?
	let nodeId : String?
	let receivedEventsUrl : String?
	let type : String?
	let url : String?


	enum CodingKeys: String, CodingKey {
		case avatarUrl = "avatar_url"
		case gravatarId = "gravatar_id"
		case id = "id"
		case login = "login"
		case nodeId = "node_id"
		case receivedEventsUrl = "received_events_url"
		case type = "type"
		case url = "url"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		avatarUrl = try values.decodeIfPresent(String.self, forKey: .avatarUrl)
		gravatarId = try values.decodeIfPresent(String.self, forKey: .gravatarId)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		login = try values.decodeIfPresent(String.self, forKey: .login)
		nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
		receivedEventsUrl = try values.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}


}
