//
//  swiftui_frameuserApp.swift
//  swiftui_frameuser
//
//  Created by HHI on 2021/07/29.
//

import SwiftUI
import UIKit
import Firebase

@main
struct swiftui_frameuserApp: App {
 
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //필요할때  주석 삭제 하면 됨. registerview 는 사용자 정보 등록하는 것이고, CHECkview 는 등록 된 정보를 확인하는 용도이다.
//            registerView(imageURL:"" )
            checkView(imageURL: "")
        }
    }
}
