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
//           registerView()
//            checkView()
            new_checkView()
        }
    }
}
