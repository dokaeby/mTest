//
//  GitHubServiceType.swift
//  mTest
//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//

import RxSwift
import Alamofire

protocol GitHubServiceType {
    func requestGitHubSearchReposRx(page:Int, repoName: String) -> Single<SearchReposResponse>
    // Swift
    func requestGitHubSearchReposSwift(page:Int, repoName: String, completion: @escaping (Result<SearchReposResponse>) -> ()) 
}
