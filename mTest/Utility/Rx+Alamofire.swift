//
//  Rx+Alamofire.swift
//  mTest
//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//

import RxCocoa
import RxSwift
import Alamofire

extension Reactive where Base: SessionManager {
    
    func request(url: URLRequestConvertible) -> Single<Data> {
        return Single.create(subscribe: { (observer) -> Disposable in
            self.base.request(url)
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
