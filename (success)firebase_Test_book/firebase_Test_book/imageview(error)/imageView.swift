//
//  imageView.swift
//  firebase_Test_book
//
//  Created by HHI on 2021/08/02.


//10:04
//23:30

import SwiftUI

struct imageView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("안녕 세상! ")
                    .navigationTitle("첫번째 페이지")
                NavigationLink(
                    destination : NextView(),
                    label: {
                        Text("Navigaes to second page")
                    })
            }
        }
        
    }
}

struct NextView: View{
    var body: some View{
        ViewBuilder{
//            navigationBarBackButtonHidden(false)
            Button(action: {
                imageView()
            }){
                Text("upload Photo")
            }
            
            @IBAction func setDefaultLabelText(_ sender : UIButton){
                Label = "default label"
            }
//
        }
    }
}

struct imageView_Previews: PreviewProvider {
    static var previews: some View {
        imageView()
    }
}
