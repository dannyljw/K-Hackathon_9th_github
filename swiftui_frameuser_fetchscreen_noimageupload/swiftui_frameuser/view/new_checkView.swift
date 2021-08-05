//
//  new_checkView.swift
//  swiftui_frameuser
//
//  Created by HHI on 2021/08/01.
//
import SwiftUI
import Firebase


struct new_checkView: View {
    @StateObject var viewmodel = userViewModel()


//전체 적으로 화면이 너무 가운데에 뭉쳐 있는 것 같다. iphone 12 mini 로 할때는 문제가 없던거 같은데... 왜 이렇게 되는지 생각해봐야될거 같다.
    var body: some View {
//        ForEach (viewmodel.users, id: \.self ) { user in

        VStack{
            ForEach (viewmodel.users, id: \.self ) { user in
            Text("산책자 정보")
            Divider()
            VStack{
                HStack{
//사진도 storage 통해서 넣을 수 있도록 만들어야되는데... 어떻게 할 수 있는 것인지 생각해봐야된다. 어렵다 어려워
                    Text("사진")
                        .background(Rectangle().foregroundColor(.white))
                        .frame(width: 150, height: 140, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.blue))
                    
                    Divider()
                        .frame(height:120)
                    
                    VStack{
                        
                        HStack{
                            Text("이름")
                                .background(Rectangle().foregroundColor(.white))
                                .frame(width: 50, height: 30, alignment: .leading)
//                            TextField("  이름", text: $viewmodel.a)
                            Text(user.name)
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
                            Text(user.sex)
                                .font(.subheadline)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                    
                        
                        
                        HStack{
                            Text("나이")
                                .background(Rectangle().foregroundColor(.white))
                                .frame(width: 50, height: 30, alignment: .leading)
                            Text("\(user.age)")
                                .font(.subheadline)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                    }
                }
                
                VStack{
    
                    HStack{
                        
                        Text("  현재 위치")
                            .background(Rectangle().foregroundColor(.white))
                            .frame(width: 130, height: 30, alignment: .leading)
                        Text(user.location)
                            .font(.subheadline)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    HStack{
// 글자 작성하는 것 뒤에 "~~년" 이 나올수 있도록 수정할 것
                        Text("  돌봄 경력")
                            .background(Rectangle().foregroundColor(.white))
                            .frame(width: 130, height: 30, alignment: .leading)
                        Text("\(user.dogduration)")
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
                Text("  상세 설명")
                    .frame(maxWidth: .infinity, alignment: .leading)
//아직 이상하게 한줄로만 작성이 가능하다. 어떻게 해야지 수정할수 있는지 생각을 해봐야된다.
                Text(user.selfappeal)
                    .frame(width: 300, height: 200)
                    .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.gray))
                    
            }
            .frame(width: 330, height: 250)
            .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.gray))
            
//버튼이 디자인을 좀 바꿔야된다. 어떻게 바꾸는 것인지 조금만 나중에 생각을 해보자.
            Button(action: {
                viewmodel.writeData()
            }) {
                Text("등록하기")
            }
        }
    }.onAppear(){
        viewmodel.fetchData()
    }
}
}

struct new_checkView_Previews: PreviewProvider {
    static var previews: some View {
        new_checkView()
    }
}
