//
//  ViewController.swift
//  Navigation
//
//  Created by 이정찬 on 2022/05/24.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "lamp-On.jpeg")
    let imgOff = UIImage(named: "lamp-Off.jpeg")
    
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" { //버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" { //바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Bar button"
        }
        
        //수정화면으로 텍스트 메시지와 전구 상태 전달
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    
    //메시지 값을 텍스트 필드에 표시
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    //전구 이미지 값 세팅
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
}

