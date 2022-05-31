//
//  ViewController.swift
//  TapTouch
//
//  Created by 이정찬 on 2022/05/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtMessage: UILabel!
    @IBOutlet var txtTapCount: UILabel!
    @IBOutlet var txtTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //터치가 시작될 때 호출
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEvent(touches, messageText: "터치가 되었습니다.")
    }
    
    //터치된 부분이 움직일 때 호출
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEvent(touches, messageText: "터치가 이동중입니다.")
    }
    
    //터치된 부분을 뗴었을 때 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchEvent(touches, messageText: "터치가 끝났습니다.")
    }
    
    //터치 이밴트를 처리할 함수
    func touchEvent(_ touches: Set<UITouch>, messageText: String?){
        let touch = touches.first! as UITouch //터치 이벤트 가져옴
        
        txtMessage.text = messageText //현재 발생한 이벤트 종류 출력
        txtTapCount.text = String(touch.tapCount) //터치된 횟수 출력
        txtTouchCount.text = String(touches.count) //터치된 갯수 출력
    }
}

