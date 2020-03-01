//
//  ServiceError.swift
//  mTest
//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case unknown
    case requestFailed(Error)
    case decodeError
}
