//
//  userViewModel.swift
//  firebase_userinfo_fetchstore
//
//  Created by HHI on 2021/07/31.
//

import Foundation
import FirebaseFirestore

class userViewModel: ObservableObject{
    @Published var users = [user] ()
    @Published var a = ""//name
    @Published var b = ""//age
    @Published var c = ""//sex
    @Published var d = ""//location
    @Published var e = ""//dogduration
    @Published var f = ""//selfappeal
    
    private var db = Firestore.firestore()
    
    //writedata()
    func writeData(){
        db.collection("user_Info").document("user_A").setData([
            "name"       : a,
            "age"        : b,
            "sex"        : c,
            "location"   : d,
            "dogduration": e,
            "selfappeal" : f
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
        db.collection("users").addSnapshotListener {(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
            print("No documents")
            return
        }
            
            self.users = documents.map {QueryDocumentSnapshot -> user in
                let data = QueryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let sex = data["sex"] as? String ?? ""
                let age = data["age"] as? Int ?? 0
                let location = data["location"] as? String ?? ""
                let dogduration = data["dogduration"] as? Int ?? 0
                let selfappeal = data["selfappeal"] as? String ?? ""
                return user (id: .init(), name: name, age: age, sex: sex, location: location, dogduration: dogduration, selfappeal: selfappeal)
            }
        }
    }
}
