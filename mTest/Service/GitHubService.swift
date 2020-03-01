//
//  GitHubService.swift
//  mTest
//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//

import RxCocoa
import RxSwift
import Alamofire

struct GitHubService: GitHubServiceType {
    // RX
    func requestGitHubSearchReposRx(page:Int, repoName: String) -> Single<SearchReposResponse> {
        return Router.buildRequest(url: Router.searchRepos(page:page, repoName: repoName))
            .map { data throws in
                let response = try JSONDecoder().decode(SearchReposResponse.self, from: data)
                return response
            }
    }

    // Swift
    func requestGitHubSearchReposSwift(page:Int, repoName: String, completion: @escaping (Result<SearchReposResponse>) -> ()) {
        Alamofire.request(Router.searchRepos(page:page, repoName: repoName))
            .validate(statusCode: 200..<400)
            .responseData { response in
                switch response.result {
                case .success(let value):
                    do {
                        let result = try JSONDecoder().decode(SearchReposResponse.self, from: value)
                        iPrint(result)
                        completion(Result.success(result))
                    } catch {
                        completion(Result.failure(ServiceError.decodeError))
                    }
                case .failure(let error):
                    completion(Result.failure(ServiceError.requestFailed(error)))
                }
        }
    }

}

