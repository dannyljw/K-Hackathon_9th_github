//
//  userViewModel.swift
//  swiftui_frameuser
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
//지금은 로그인한 user 에 따라서 데이터를 구분해 놓지 않은 상태이다.
//나중에는 구분이 가능하도록 만들어야된다.
        db.collection("user_Info").document("user_A").setData([
            "name"       : a,
            "sex"        : b,
            "age"        : Int(c)!,
            "location"   : d,
            "dogduration": Int(e)!,
            "selfappeal" : f
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    //fetchData()
    func fetchData() {

        db.collection("user_Info").addSnapshotListener {(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
            print("No documents")
            return
        }
            
            self.users = documents.map {QueryDocumentSnapshot -> user in
//이것들도 abcd 로 바꿔서 해야되나? 일단 해보고 잘 모르겠으면 질문하는 것으로.. abcd 로 해야지 내가 헷갈리지 않을까 싶음. 
                let data = QueryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let sex = data["sex"] as? String ?? ""
                let age = data["age"] as? Int ?? 0
                let location = data["location"] as? String ?? ""
                let dogduration = data["dogduration"] as? Int ?? 0
                let selfappeal = data["selfappeal"] as? String ?? ""
                return user (id: .init(), name: name, sex: sex, age: age, location: location, dogduration: dogduration, selfappeal: selfappeal)
            }
        }
    }
    
}
//단일 다큐 먼트에서 뽑아 내는 방법. ?
//검색할때 키워드 , 스위프트, 파이어베이스, 뒤에는 fetch specific document

