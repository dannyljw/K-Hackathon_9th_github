//
//  userModel.swift
//  swiftui_frameuser
//
//  Created by HHI on 2021/07/31.
//

import Foundation
struct user: Identifiable, Hashable {
    
    var id          : String = UUID().uuidString
    var name        : String
    var sex         : String
    var age         : Int
    var location    : String
    var dogduration : Int
    var selfappeal  : String
    
}
