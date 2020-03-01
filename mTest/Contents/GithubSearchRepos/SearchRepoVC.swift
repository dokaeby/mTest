//
//  SearchRepoVC.swift
//  mTest
//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import RxGesture
import SnapKit
import Then

class SearchRepoVC: UIViewController {
    
    //MARK:- Properties
    
    lazy var disposeBag = DisposeBag()
    lazy var dataList:[SearchRepoItem] = []
    
    lazy var searchKeyword:String = ""
    
    lazy var countPerPage: Int = 30
    lazy var pageCount: Int = 0
    
    var  searchVM:SearchRepoVM!
    
    //MARK:- UI Properties
    private struct UI {
        static let basicMargin: CGFloat = 10
        static let searchButtonHeight: CGFloat = 50
        static let cellHeight: CGFloat = 80
    }
    // Search Bar
    lazy var searchBar:UISearchBar = UISearchBar().then {
        $0.placeholder = "검색"
        $0.showsCancelButton = true
        $0.setValue("취소", forKey: "cancelButtonText")
    }
    // Search Results List
    lazy var searchListV:UITableView = UITableView().then {
        $0.backgroundColor = UIColor.white
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 60
        $0.delaysContentTouches = true
        $0.canCancelContentTouches = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(SearchListVCell.self, forCellReuseIdentifier: SearchListVCell.CellIdentifier)
    }

    // MARK:- init
    // viewController event  ==================
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        
        setupView()
        setupLayout()
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Initialize properties of class
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.topItem?.title = "Search Repo"
        // search bar cancel button 텍스트 변경 cancel -> 취소
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "취소"

    }
    
    // MARK:- add view,setup layout
    func setupView() -> Void {
        
        view.backgroundColor = UIColor.white
        
        [searchBar, searchListV].forEach { view.addSubview($0) }
        
    }
    
    func setupLayout() -> Void {

        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            $0.height.equalTo(UI.searchButtonHeight)
        }

        searchListV.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    // MARK:- UI action binding
    func setupUIBinding() -> Void {
        
        searchVM = SearchRepoVM()
        
        searchBar.rx.text.orEmpty                                                                   // 입력된 text가 비어있는지 확인
            .bind(to: searchVM.searchText)                                                          // VM에 binding
            .disposed(by: self.disposeBag)
                
        searchVM.dataList                                                                           // 수신한 repo data 수신시 처리
            .asDriver(onErrorJustReturn: [])
            .drive(searchListV.rx.items) {                                                          // 수신한 items리스트를 tableview와 bind하여 결과를 출력
                tableView, indexPath, repo in
                iPrint("repo = \(repo)")
                let cell = tableView.dequeueReusableCell(withIdentifier: SearchListVCell.CellIdentifier)! as? SearchListVCell
                cell?.configure(repo)                                                               // 수신한 데이타를 각 cell에 전달하여 출력
                return cell!
            }
            .disposed(by: self.disposeBag)

    }
}

