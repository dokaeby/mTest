//
//  Router.swift
//  mTest
//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//

import RxSwift
import Alamofire

/*
 1. repository 검색 https://api.github.com/search/repositories?q=tetris+language:swift&sort=stars&order=desc

 */

enum Router {
    case searchRepos(page:Int, repoName: String)
}

extension Router: TargetType {
    
    // GitHub Key
    static let clientID: String = "075f9bae947051708b29"
    static let clientSecret: String = "e5593a561341875f9a5a768bca8d74b398aff81e"
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .searchRepos:
            return "/search/repositories"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .searchRepos:
            return .get
        }
    }
    
    var header: HTTPHeaders {
        switch self {
        case .searchRepos:
            return [:]
        }
    }
    
    var parameter: Parameters {
        switch self {
        case .searchRepos(let page, let repoName):
            return ["page":page,
                    "q"   :repoName]
        }
    }
}

// Rx Alamofire Request
extension Router {
    
    static let manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        let manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()
    
    static func buildRequest(url: URLRequestConvertible) -> Single<Data> {
        return Single.create(subscribe: { (observer) -> Disposable in
            Router.manager.request(url)
                .validate(statusCode: 200..<400)
                .responseData(completionHandler: { data in
                    switch data.result {
                    case .success(let value):
                        observer(.success(value))
                    case .failure(let error):
                        observer(.error(ServiceError.requestFailed(error)))
                    }
                })
            return Disposables.create()
        })
    }
}

extension Router: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .searchRepos:
            let url = self.baseURL.appendingPathComponent(self.path)
            var urlRequest = try URLRequest(url: url, method: self.method, headers: self.header)
            urlRequest = try URLEncoding.default.encode(urlRequest, with: self.parameter)
            iPrint("Router .\(self) URL : ",urlRequest)
            return urlRequest
        }
    }
}
