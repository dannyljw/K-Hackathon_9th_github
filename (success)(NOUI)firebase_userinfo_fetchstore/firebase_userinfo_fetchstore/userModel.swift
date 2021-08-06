//
//  userModel.swift
//  firebase_userinfo_fetchstore
//
//  Created by HHI on 2021/07/31.
//

import Foundation

struct user: Identifiable, Hashable{
    
    var id          : String = UUID().uuidString
    var name        : String
    var age         : Int
    var sex         : String
    var location    : String
    var dogduration : Int
    var selfappeal  : String
    
}
