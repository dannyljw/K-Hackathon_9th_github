//
//  bookviewmodel.swift
//  firebase_Test_book
//
//  Created by HHI on 2021/07/31.
//
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import SwiftUI

class bookViewModel: ObservableObject {
    @Published var books = [book] ()
//    @Published var book_title
    //실제로 데이터를 갖고 있는 공간이다.
    private var db = Firestore.firestore()
    
    //writeData()
    func writeData(){
        db.collection("user_Info").document("user_A").setData([
            "name": "user_A",
            "age": "25",
            "sex": "male",
            "location": "죽전동",
            "dogduration": "12"
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        
            
        }
        
    }
    
    //featchData()
    func fetchData() {
        db.collection("books").addSnapshotListener {(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
            print("No documents")
            return
        }
            
            self.books = documents.map{QueryDocumentSnapshot -> book in
                let data = QueryDocumentSnapshot.data()
                let title = data["title"] as? String ?? ""
                let author = data["author"] as? String ?? ""
                let numberOfPages = data["pages"] as? Int ?? 0
                return book (id: .init(), title: title, author: author, pages: numberOfPages)
            }
        
        }
    }//func fetchData()
    
 
    
}
//
//class userViewModel: ObservableObject{
//    @Published var users = [userinfo] ()
//    private var db = Firestore.firestore()
//    
//    func fetchUserData(){
//        db.collection("userInfo").addSnapshotListener {(querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else{
//                print("No Documents")
//                return
//            }//else
//            self.users = documents.map{QuaeryDocumentSnapshot -> userinfo in
//                let data = QueryDocumentSnapshot.data()
//                let name = data["name"] as? String ?? ""
//                let age = data["age"] as? String ?? ""
//                let sex = data["sex"] as? String ?? ""
//                let location = data["location"] as? String ?? ""
//                let dogduration = data["dogduration"] as? String ?? ""
//                return userinfo (id: .init(), name : name, age : age, sex: sex, location: location, dogduration : dogduration)
//            }
//        }
//    }
//    
//}
class TabbarViewController2: UIViewController{
    let storage = Storage.storage()
    
}
