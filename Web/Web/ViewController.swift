//
//  ViewController.swift
//  Web
//
//  Created by 이정찬 on 2022/05/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    //url의 인수를 통해 웹 페이지 주소를 전달받아 보여줌
    func loadWebPage(_ url: String) {
        let myUrl =  URL(string: url)
        let myRequeat = URLRequest(url: myUrl!)
        myWebView.load(myRequeat)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("https://www.google.co.kr")//앱 실행시 초기 웹 페이지
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // "http://"문자열이 없을 시 자동으로 앞에 삽입
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    //텍스트 필드에 적힌 주소로 로딩
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    //네이버 버튼 클릭시 네이버 주소로 이동
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://www.naver.com")
    }
    
    //다음 버튼 클릭시 다음 주소로 이동
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://www.daum.net")
    }
    
    // HTML 코드를 변수에 저장하고 클릭하면, 문법에 맞게 웹 뷰로 나타냄
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p> <p> <a href =\"https://www.google.co.kr\"> 구글</a>로 이동</p> <p> <a href =\"https://www.naver.com\"> 네이버</a>로 이동</p> <p> <a href =\"https://www.daum.net\"> 다음</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    // HTML파일을 웹 뷰로 나타냄
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() //웹 페이지 로딩 중지
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload() //웹 페이지 재로딩
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack() //이전 웹 페이지로 이동
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward() //다음 웹 페이지로 이동
    }
}

