//
//  MyTextView.swift
//  Tutorial
//
//  Created by 이정찬 on 2022/06/15.
//

import SwiftUI

struct MyTextView: View {
    
    //데이터 연동
    @Binding
    var isActiveted: Bool
    
    //생성자
    init(isActiveted: Binding<Bool> = .constant(false)) {
        _isActiveted = isActiveted
    }
    
    @State //값의 변화 감지
    private var index: Int = 0
    
    //배경색 배열
    private let backgroundColors = [
        Color.red,
        Color.blue,
        Color.green,
        Color.white
    ]
    
    var body: some View {
        VStack{
            Spacer()
            Text("아무거나\(self.index)")
                .font(.system(size: 40))
                .fontWeight(.light)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
            Text("불리언값 상태: \(String(isActiveted))")
                .font(.system(size: 40))
                .fontWeight(.light)
                .foregroundColor(self.isActiveted ? Color.yellow : Color.black)
            Spacer()
                
        }
        .background(backgroundColors[index])
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경아이템 클릭")
            if(self.index == self.backgroundColors.count - 1){
                self.index = 0
            }else{
                self.index += 1
            }
        }
    }
}

struct MyTextView_Previews: PreviewProvider{
    static var previews: some View{
        MyTextView()
    }
}
