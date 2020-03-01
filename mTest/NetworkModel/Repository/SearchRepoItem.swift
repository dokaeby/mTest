//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//
//	SearchRepoItem.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct SearchRepoItem : Codable {

	let createdAt : String?
	let defaultBranch : String?
	let descriptionField : String?
	let fork : Bool?
	let forksCount : Int?
	let fullName : String?
	let homepage : String?
	let htmlUrl : String?
	let id : Int?
	let language : String?
	let masterBranch : String?
	let name : String?
	let nodeId : String?
	let openIssuesCount : Int?
	let owner : Owner?
	let privateField : Bool?
	let pushedAt : String?
	let score : Float?
	let size : Int?
	let stargazersCount : Int?
	let updatedAt : String?
	let url : String?
	let watchersCount : Int?


	enum CodingKeys: String, CodingKey {
		case createdAt = "created_at"
		case defaultBranch = "default_branch"
		case descriptionField = "description"
		case fork = "fork"
		case forksCount = "forks_count"
		case fullName = "full_name"
		case homepage = "homepage"
		case htmlUrl = "html_url"
		case id = "id"
		case language = "language"
		case masterBranch = "master_branch"
		case name = "name"
		case nodeId = "node_id"
		case openIssuesCount = "open_issues_count"
		case owner
		case privateField = "private"
		case pushedAt = "pushed_at"
		case score = "score"
		case size = "size"
		case stargazersCount = "stargazers_count"
		case updatedAt = "updated_at"
		case url = "url"
		case watchersCount = "watchers_count"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		defaultBranch = try values.decodeIfPresent(String.self, forKey: .defaultBranch)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		fork = try values.decodeIfPresent(Bool.self, forKey: .fork)
		forksCount = try values.decodeIfPresent(Int.self, forKey: .forksCount)
		fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
		homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		masterBranch = try values.decodeIfPresent(String.self, forKey: .masterBranch)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		nodeId = try values.decodeIfPresent(String.self, forKey: .nodeId)
		openIssuesCount = try values.decodeIfPresent(Int.self, forKey: .openIssuesCount)
		owner = try Owner(from: decoder)
		privateField = try values.decodeIfPresent(Bool.self, forKey: .privateField)
		pushedAt = try values.decodeIfPresent(String.self, forKey: .pushedAt)
		score = try values.decodeIfPresent(Float.self, forKey: .score)
		size = try values.decodeIfPresent(Int.self, forKey: .size)
		stargazersCount = try values.decodeIfPresent(Int.self, forKey: .stargazersCount)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		watchersCount = try values.decodeIfPresent(Int.self, forKey: .watchersCount)
	}


}
