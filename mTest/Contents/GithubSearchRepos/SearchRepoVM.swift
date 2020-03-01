//
//  SearchRepoVM.swift
//  mTest
//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class SearchRepoVM {
    
    // input
    let searchText =  BehaviorRelay<String>(value: "")
    // output
    var dataList = PublishSubject<[SearchRepoItem]>()
    // dispose bag
    let disposeBag = DisposeBag()
    
    init() {
        
        weak var ws = self
        
        searchText
            .asObservable()
            .filter { keyword in
                return keyword.count > 2                                                            // 입력된 text가 2보다 큰 경우만 검색하도록 필터링
            }
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .flatMapLatest { keyword in                                                             // 입력된 text로 네트워크 호출후 수신한 응답에서 가장 최신 결과를 전달
                return GitHubService().requestGitHubSearchReposRx(page:0,repoName:keyword)          // github repo 검색 API 호출
                    .retry(2)                                                                       // 네트워크 호출이 실패할 경우 retry 최대 2회
                    .observeOn(ConcurrentDispatchQueueScheduler(qos: .default))                     // 메인 스케줄러가 아닌 스케줄러에서 네트워크 처리
                
            }
            .map { response in                                                                      // 수신한 response에서 items 리스트만 전달하도록 매핑
                return response.items!
            }
            .bind(to: ws!.dataList)                                                                 // 수신한 items 리스트를 출력할 dataList와 binding
            .disposed(by: self.disposeBag)
    }
}
