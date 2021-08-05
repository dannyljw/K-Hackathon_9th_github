//
//  firebase_Test_bookApp.swift
//  firebase_Test_book
//
//  Created by HHI on 2021/07/29.
//
//
//import SwiftUI
//

//
//
//import UIKit
//import Firebase
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//  var window: UIWindow?
//
//  func application(_ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions:
//        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    FirebaseApp.configure()
//    return true
//  }
//}
//
//
import SwiftUI
import Firebase

//final class AppDelegate: NSObject, UIApplicationDelegate{
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//}

@main
struct firebase_Test_bookApp : App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
           BooksListView()
        }
    }
}


