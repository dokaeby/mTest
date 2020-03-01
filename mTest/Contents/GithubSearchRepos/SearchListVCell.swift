//
//  SearchListVCell.swift
//  mTest
//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//

import UIKit
import Kingfisher
import Then

final class SearchListVCell: UITableViewCell {
    
    //MARK:- Constant
    
    static var CellIdentifier: String { return String(describing: self) }
    
//    private(set) var disposeBag = DisposeBag()
    
    //MAKR:- UI Properties
    private struct UI {
        static let basicMargin: CGFloat = 5
        static let cellHeight:CGFloat = 100
    }
    
    lazy var descriptionLabelV: UILabel = UILabel().then {
        $0.text = "Description : "
        $0.textColor = UIColor.black
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 12)
    }

    lazy var urlLabelV: UILabel = UILabel().then {
        $0.text = "Url : "
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    lazy var createdTimeLabelV: UILabel = UILabel().then {
        $0.text = "CreatedAt : "
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 12)
    }

    lazy var langueageLabelV: UILabel = UILabel().then {
        $0.text = "Langueage : "
        $0.textColor = UIColor.black
        $0.font = UIFont.systemFont(ofSize: 12)
    }

    lazy var starLabelV: UILabel = UILabel().then {
        $0.text = "Star : "
        $0.textColor = UIColor.blue
        $0.font = UIFont.systemFont(ofSize: 12)
    }

    //MARK:- Properties
    
    
    //MARK:- Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        
        [ descriptionLabelV, urlLabelV, createdTimeLabelV,
          langueageLabelV, starLabelV ].forEach { contentView.addSubview($0) }
                
        descriptionLabelV.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(UI.basicMargin)
            $0.left.equalTo(contentView.snp.left).offset(UI.basicMargin)
            $0.right.equalTo(contentView.snp.right).offset(-UI.basicMargin)
        }
        
        urlLabelV.snp.makeConstraints {
            $0.top.equalTo(descriptionLabelV.snp.bottom).offset(UI.basicMargin)
            $0.left.equalTo(contentView.snp.left).offset(UI.basicMargin)
        }
        
        createdTimeLabelV.snp.makeConstraints {
            $0.top.equalTo(urlLabelV.snp.bottom).offset(UI.basicMargin)
            $0.left.equalTo(contentView.snp.left).offset(UI.basicMargin)
        }
        
        langueageLabelV.snp.makeConstraints {
            $0.top.equalTo(createdTimeLabelV.snp.bottom).offset(UI.basicMargin)
            $0.left.equalTo(contentView.snp.left).offset(UI.basicMargin)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-UI.basicMargin)
        }
        
        starLabelV.snp.makeConstraints {
            $0.top.equalTo(createdTimeLabelV.snp.bottom).offset(UI.basicMargin)
            $0.left.equalTo(langueageLabelV.snp.right).offset(UI.basicMargin)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-UI.basicMargin)
        }
    }
    
    func configure(_ data: SearchRepoItem) {
        
        iPrint("Cell configure")
        descriptionLabelV.text = "Description : " + (data.descriptionField ?? "")
        urlLabelV.text = "Url : " + (data.url ?? "")
        createdTimeLabelV.text = "CreatedAt : " + (data.createdAt ?? "")
        langueageLabelV.text = "Langueage : " + (data.language ?? "")
        starLabelV.text = "Star : " + String(data.stargazersCount!)
    }
    
    override public func prepareForReuse() {
        // Ensures the reused cosmos view is as good as new
    }
}

