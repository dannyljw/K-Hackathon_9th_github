//
//  ContentView.swift
//  swiftui_frameuser
//
//  Created by HHI on 2021/07/29.
//

import SwiftUI
import Combine
import Firebase
import FirebaseStorage

let FILE_NAME = "images/imageFileTest.jpg"

struct registerView: View {
    @StateObject var viewmodel = userViewModel()
    @ObservedObject var imageLoader:DataLoader
    @State var image:UIImage = UIImage()
    @State var shown = false
    @State var imageURL = ""
    //
    @State var text: String = "Multiline \ntext \nis called \nTextEditor"
//
    
    init(imageURL: String) {
        imageLoader = DataLoader(urlString:imageURL)
    }

//전체 적으로 화면이 너무 가운데에 뭉쳐 있는 것 같다. iphone 12 mini 로 할때는 문제가 없던거 같은데... 왜 이렇게 되는지 생각해봐야될거 같다.
    var body: some View {
        
        VStack{
            Text("산책자 정보")
            Divider()
            VStack{
                HStack{
//사진도 storage 통해서 넣을 수 있도록 만들어야되는데... 어떻게 할 수 있는 것인지 생각해봐야된다. 어렵다 어려워
                    
                    //사진을 넣어야되는 곳이다.
//                    Text("사진")
//                        .background(Rectangle().foregroundColor(.white))
//                        .frame(width: 150, height: 140, alignment: .center)
//                        .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.blue))
                    VStack{
                    //사진을 넣어야되는 곳이다.
                        if imageURL != "" {
                            FirebaseImageView(imageURL: imageURL)
//                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth:3))
//
                                .shadow(radius: 5)
                                .padding()
                        }
                        
                        Button(action: { self.shown.toggle() }){
                            Text("+").font(.headline)//.bold()
//                                .offset(y:-50)
                        }.sheet(isPresented: $shown) {
                            imagePicker(shown: self.$shown,imageURL: self.$imageURL)
//                                .offset(y: -100)
//                        .overlay(Circle().stroke(Color.blue, lineWidth:10))
//                        .shadow(radius: 5)
                        }
//                        .clipShape(Circle())
//                        .padding(1).background(Color.blue).foregroundColor(Color.white)
                                .padding(5).background(Color.blue).foregroundColor(Color.white).cornerRadius(7)
                        .offset(y:-40)
                    }
                    Divider()
                        .frame(height:120)
                    
                    VStack{
                        
                        HStack{
                            Text("이름")
                                .background(Rectangle().foregroundColor(.white))
                                .frame(width: 50, height: 30, alignment: .leading)
                            TextField("  이름", text: $viewmodel.a)
                                .font(.subheadline)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
//이렇게 하면 text, textfield 에 전체적으로 Roundedborder 가 생성됨
//.overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.blue))
                        
                        
                        
                        HStack{
//성별을 버튼 형식으로 하는 것이 좋은데 어떻게 해야지 변형할수 있는지 생각해보기!!!!!!!
                            Text("성별")
                                .background(Rectangle().foregroundColor(.white))
                                .frame(width: 50, height: 30, alignment: .leading)
                            TextField("  성별", text: $viewmodel.b)
                                .font(.subheadline)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                    
                        
                        
                        HStack{
                            Text("나이")
                                .background(Rectangle().foregroundColor(.white))
                                .frame(width: 50, height: 30, alignment: .leading)
                            TextField("  나이", text: $viewmodel.c)
                                .font(.subheadline)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                    }
                }

                
                VStack{
    
                    HStack{
                        
                        Text("  현재 위치")
                            .background(Rectangle().foregroundColor(.white))
                            .frame(width: 130, height: 30, alignment: .center)
                        TextField("  현재 위치", text: $viewmodel.d)
                            .font(.subheadline)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 150, height: 30, alignment: .leading)
                        Spacer()

                    }

                    HStack{
// 글자 작성하는 것 뒤에 "~~년" 이 나올수 있도록 수정할 것
                        Text("  돌봄 경력")
                            .background(Rectangle().foregroundColor(.white))
                            .frame(width: 130, height: 30, alignment: .center)
                        TextField("  돌봄 경력", text: $viewmodel.e)
                            .font(.subheadline)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
//년이랑 개월로 하는거 이거 정해야된다. 어떤식으로 표현을 할지에 대해서 얘기를 해야된다.
                        Text("개월")
                            .background(Rectangle().foregroundColor(.white))
                            .frame(width: 130, height: 30, alignment: .leading)
                        
                        
                    }

                }
        }
            Divider()
            VStack{
//                Text(" ")
                Text("  상세 설명")
                    .frame(width : 350,height : 30, alignment: .leading)
                TextEditor(text: $viewmodel.f)
                    .frame(width: 300, height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.gray))
//                    Text(" ")
//                TextField("자신을 어필하는 글을 적어 주세요", text: $viewmodel.f)
//                    .frame(width: 300, height: 200)
//                    .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.gray))
//
            }
            .frame(width: 330, height: 300)
            .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.gray))
            
//버튼이 디자인을 좀 바꿔야된다. 어떻게 바꾸는 것인지 조금만 나중에 생각을 해보자.
            Button(action: {
                viewmodel.writeData()
            }) {
                Text("등록하기")
            }
        }.onReceive(imageLoader.didChange) { data in
            //큰 Vstack
            self.image = UIImage(data: data) ?? UIImage()
        }.onAppear(perform: loadImageFromFirebase).animation(.spring()) //data in
    
    
    }// var body
    //
    func loadImageFromFirebase() {
        let storage = Storage.storage().reference(withPath: FILE_NAME)
        storage.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            print("registerview, func loadimagefrom firebase() Download success")
            self.imageURL = "\(url!)"
            print(self.imageURL)
        }
    }//func load image from firebase
    //
}//struct register view
    

    
    
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        registerView(imageURL: " ")
    }
}


