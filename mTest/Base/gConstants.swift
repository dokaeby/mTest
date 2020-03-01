//
//  gConstants.swift
//  mTest
//
//  Created by 양성훈 on 2020/03/01.
//  Copyright © 2020 양성훈. All rights reserved.
//

import Foundation

// MARK: - print log
public func iPrint(_ objects:Any... , filename:String = #file,_ line:Int = #line, _ funcname:String = #function){
    #if DEBUG
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss:SSS"
    let file = URL(string:filename)?.lastPathComponent.components(separatedBy: ".").first ?? ""
    print("💦info 🦋\(dateFormatter.string(from:Date())) 🌞\(file) 🍎line:\(line) 🌹\(funcname)🔥",terminator:"")
    for object in objects{
        print(object, terminator:"")
    }
    print("\n")
    #endif
}





