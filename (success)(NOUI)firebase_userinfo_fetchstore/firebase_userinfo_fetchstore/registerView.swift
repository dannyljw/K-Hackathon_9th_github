//
//  registerView.swift
//  firebase_userinfo_fetchstore
//
//  Created by HHI on 2021/07/31.
//

import SwiftUI
import Firebase


struct registerView: View {
    @StateObject var viewmodel = userViewModel()
    var body: some View {
        VStack{
//            TextField("등록하세요", )
            Text("hello")
            TextField("name", text: $viewmodel.a)
            TextField("age", text: $viewmodel.b)
            TextField("sex", text: $viewmodel.c)
            TextField("location", text: $viewmodel.d)
            TextField("dogduration", text: $viewmodel.e)
            TextField("selfappeal", text: $viewmodel.f)
            
            Button(action: {
                viewmodel.writeData()
            }){
                Text("등록하기")
            }
        }
    }
}

struct registerView_Previews: PreviewProvider {
    static var previews: some View {
        registerView()
    }
}
