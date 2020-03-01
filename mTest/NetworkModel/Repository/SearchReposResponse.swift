//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//
//	SearchReposResponse.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct SearchReposResponse : Codable {

	let incompleteResults : Bool?
	let items : [SearchRepoItem]?
	let totalCount : Int?


	enum CodingKeys: String, CodingKey {
		case incompleteResults = "incomplete_results"
		case items = "items"
		case totalCount = "total_count"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		incompleteResults = try values.decodeIfPresent(Bool.self, forKey: .incompleteResults)
		items = try values.decodeIfPresent([SearchRepoItem].self, forKey: .items)
		totalCount = try values.decodeIfPresent(Int.self, forKey: .totalCount)
	}


}
