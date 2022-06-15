//
//  MyWebView.swift
//  SwiftUI_Webview_tutorial
//
//  Created by 이정찬 on 2022/06/15.
//

import SwiftUI
import WebKit


//uikit의 uiview를 사용할 수 있도록 한다.
//UIViewControllerRepresentable
struct MyWebView: UIViewRepresentable {
    
    var urlToLoad: String
    
    // ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        // url 랩핑
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        //웹뷰 인스턴스 생성
        let webview = WKWebView()
        //웹뷰 로드
        webview.load(URLRequest(url: url))
        
        return webview
    }
    // 업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
        
    }
}

struct MyWebViewView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://www.naver.com/")
    }
}
