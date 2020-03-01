//
//  UIScrollView+Extension.swift
//  mTest
//
//  Created by 양성훈 on 2020/02/26.
//  Copyright © 2020 양성훈. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func resizeScrollViewContentSize() {
        
        var contentRect = CGRect.zero
        
        for view in self.subviews {
            
            contentRect = contentRect.union(view.frame)
            
        }
        
        self.contentSize = contentRect.size
        iPrint("scrollV contentSize = \(self.contentSize)")
    }
    
}
