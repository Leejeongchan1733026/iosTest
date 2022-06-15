//
//  ContentView.swift
//  Tutorial
//
//  Created by 이정찬 on 2022/06/03.
//

import SwiftUI

struct ContentView: View {
    
    @State //값이 변화하면 자동 랜더링
    private var isActivated: Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack{
        HStack{
            MyVstackView(isActivated: $isActivated)
            MyVstackView(isActivated: $isActivated)
            MyVstackView(isActivated: $isActivated)
        }
        .padding(isActivated ? 50.0 : 10.0)
        .background(isActivated ? Color.red : Color.blue)
        .onTapGesture {
            print("클릭됨")
            withAnimation{//애니메이션 추가
            self.isActivated.toggle()
            }
        }
                NavigationLink(destination: MyTextView(isActiveted: $isActivated)){
                    Text("네비게이션 버튼")
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .background(Color.green)
                        .foregroundColor(Color.black)
                        .cornerRadius(20)
                }.padding(.top, 50)
            }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
