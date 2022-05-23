//
//  ViewController.swift
//  Tab
//
//  Created by 이정찬 on 2022/05/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1 // 이미지 뷰 탭으로 이동
    }
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2 // 데이트 피커 뷰 탭으로 이동
    }
}

