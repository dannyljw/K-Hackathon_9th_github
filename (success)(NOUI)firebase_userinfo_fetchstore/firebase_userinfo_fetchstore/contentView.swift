//
//  ContentView.swift
//  firebase_userinfo_fetchstore
//
//  Created by HHI on 2021/07/31.
//

import SwiftUI
import UIKit
import FirebaseFirestore

struct contentView: View {
    @StateObject var viewmodel = userViewModel()
    
    var body: some View {
        VStack{
        Text("Hello, world!")
            .padding()
            ForEach (viewmodel.users, id: \.self ) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                    Text(user.sex)
                    Text(user.location)
                    Text("\(user.age)")
                    Text("\(user.dogduration)")
                    Button(action: {
                        viewmodel.writeData()
                    }) {
                        Text("등록하기")
                    }
                    }//VStack
                  }
            
        }
        .onAppear(){
            viewmodel.fetchData()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        contentView()
    }
}
