//
//  MyVstack.swift
//  Tutorial
//
//  Created by 이정찬 on 2022/06/03.
//

import SwiftUI

struct MyVstackView: View {
    
    //데이터 연동
    @Binding
    var isActivated: Bool
    //생성자
    init(isActivated: Binding<Bool> = .constant(true)){
        _isActivated = isActivated
    }
    var body: some View {
        VStack{
            Text("1!").fontWeight(.bold).font(.system(size: 60))
            Text("2!").fontWeight(.bold).font(.system(size: 60))
            Text("3!").fontWeight(.bold).font(.system(size: 60))
        }
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
    
    struct MyVstackView_Previews: PreviewProvider{
        static var previews: some View{
            MyVstackView()
        }
    }
}

