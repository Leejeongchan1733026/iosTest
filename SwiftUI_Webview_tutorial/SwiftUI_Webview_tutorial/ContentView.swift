//
//  ContentView.swift
//  SwiftUI_Webview_tutorial
//
//  Created by 이정찬 on 2022/06/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            HStack{
                NavigationLink(destination: MyWebView(urlToLoad: "https://www.naver.com/").edgesIgnoringSafeArea(.all)){
                    Text("네이버")
                        .fontWeight(.heavy)
                        .padding(20)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(destination: MyWebView(urlToLoad: "https://www.daum.net/").edgesIgnoringSafeArea(.all)){
                    Text("다음")
                        .fontWeight(.heavy)
                        .padding(20)
                        .background(Color.yellow)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(destination: MyWebView(urlToLoad: "https://www.google.com/").edgesIgnoringSafeArea(.all)){
                    Text("구글")
                        .fontWeight(.heavy)
                        .padding(20)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
