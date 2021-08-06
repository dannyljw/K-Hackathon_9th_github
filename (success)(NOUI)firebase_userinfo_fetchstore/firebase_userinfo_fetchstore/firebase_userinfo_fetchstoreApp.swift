//
//  firebase_userinfo_fetchstoreApp.swift
//  firebase_userinfo_fetchstore
//
//  Created by HHI on 2021/07/31.
//

import SwiftUI

import UIKit
import Firebase


@main
struct firebase_userinfo_fetchstoreApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            registerView()
        }
    }
}
