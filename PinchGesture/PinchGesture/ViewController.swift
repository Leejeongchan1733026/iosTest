//
//  ViewController.swift
//  PinchGesture
//
//  Created by 이정찬 on 2022/06/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)//뷰 객체의 메서드를 사용하여 핀치 제스터 등록
    }

    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
            imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale) //이미지를 scale에 맞게 변환
            pinch.scale = 1 //다음 변화를 위해 scale의 속성 1로 설정
    }
}

