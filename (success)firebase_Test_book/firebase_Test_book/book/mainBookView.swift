//
//  ContentView.swift
//  firebase_Test_book
//
//  Created by HHI on 2021/07/29.
//

import SwiftUI
import UIKit
import FirebaseFirestore



struct BooksListView: View {
//  var books = testData
  @StateObject var viewmodel = bookViewModel()

    //bookViewModel() 을 사용할 것이다.
    
  var body: some View {
    
    VStack{
        Text("hello fucking world! ")
        
        ForEach (viewmodel.books, id: \.self ) { book in
            VStack(alignment: .leading) {
                Text(book.title)
                Text(book.author)
                Text("\(book.pages)")
                }//VStack
              }
        }//onappear 를 통해서 viewmodel 안에 있는 featch data, write data 를 실행하게 되는 것이다.
    .onAppear(){
        viewmodel.fetchData()
        viewmodel.writeData()
        }//.onAppear()
    }//var body: some View{}
}//struct BooksListView: View{}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        BooksListView()
    }
}

