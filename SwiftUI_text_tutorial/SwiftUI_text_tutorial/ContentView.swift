//
//  ContentView.swift
//  SwiftUI_text_tutorial
//
//  Created by 이정찬 on 2022/06/15.
//

import SwiftUI

struct ContentView: View {
    
    static let dataFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
        return formatter
    }()
    
    var today = Date()
    var trueOrFalse : Bool = true
    var number : Double = 4.0
    
    var body: some View {
        VStack{
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
            .tracking(3)//글자 사이 간격
            .font(.system(.title2, design: .rounded))
            .fontWeight(.heavy) //폰트 두깨
            .multilineTextAlignment(.leading)//폰트 배치
            .lineLimit(10)//줄 제한
            .lineSpacing(5)//줄 사이 간격
            .truncationMode(.head)//마지막 줄 줄임 설정
            .shadow(color: Color.black, radius: 2, x: 0, y: 10)//그림자 성정
            .padding(.horizontal, 50)
            .background(Color.yellow)
            .cornerRadius(40)
            .padding(20)
            .background(Color.blue)
            .cornerRadius(40)
        Text("추가 텍스트")
                .background(Color.orange)
            
        Text("오늘의 날짜 : \(today, formatter:  ContentView.dataFormat)")
            
            Text("불리언 값 : \(String(trueOrFalse))")
            Text("숫자 : \(number)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
