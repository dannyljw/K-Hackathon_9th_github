//
//  ContentView.swift
//  Firebase_Storage_Test
//
//  Created by YOUNGSIC KIM on 2020-01-29.
//  Copyright © 2020 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI
import FirebaseStorage
import Combine

//let FILE_NAME = "images/imageFileTest.jpg"

struct imageView: View {
    @State var shown = false
    @State var imageURL = ""
    var body: some View {
        VStack {
            Text("hello world")
            
            if imageURL != "" {
                FirebaseImageView(imageURL: imageURL)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth:1))
                    .shadow(radius: 2)
                    .padding()
            }
            
            Text("hello world")
            
            
            Button(action: { self.shown.toggle() }) {
                Text("+").font(.title).bold()
            }.sheet(isPresented: $shown) {
                imagePicker(shown: self.$shown,imageURL: self.$imageURL)
//            .overlay(Circle().stroke(Color.blue, lineWidth:10))
            .shadow(radius: 5)
                }.padding(5).background(Color.blue).foregroundColor(Color.white).cornerRadius(7)
            //foreground color -> 글자 드래그 한 만큼의 색상
            //Background color -> + , ollah 까지를 Frame 씌웠을대의 배경 색상
        }.onAppear(perform: loadImageFromFirebase).animation(.spring())
    }
    
    func loadImageFromFirebase() {
        let storage = Storage.storage().reference(withPath: FILE_NAME)
        storage.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            print("iamgeview, loadimage from firebase Download success")
            
            
            self.imageURL = "\(url!)"
        }
    }
}

struct imageView_Previews: PreviewProvider {
    static var previews: some View {
        imageView()
    }
}

