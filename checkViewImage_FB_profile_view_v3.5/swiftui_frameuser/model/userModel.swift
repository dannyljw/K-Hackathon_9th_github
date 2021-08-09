//
//  userModel.swift
//  swiftui_frameuser
//
//  Created by HHI on 2021/07/31.
//

import Foundation
struct user: Identifiable, Hashable {
    
    var id          : String = UUID().uuidString
    var name        : String //sync
    var gender      : String
    var age         : Int //sync
    var location    : String
    var careDuration : String //sync 
    var description  : String //sync
//    var registeredAt : Timestamp
}
