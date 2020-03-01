//
//  Rx+ViewController.swift
//  mTest
//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//

import RxCocoa
import RxSwift
import Alamofire

extension Reactive where Base: UIViewController {
    var viewWillAppear: ControlEvent<Void> {
        let source = methodInvoked(#selector(Base.viewWillAppear)).map { _ in }
        return ControlEvent(events: source)
    }
}
