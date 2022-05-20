//
//  ViewController.swift
//  Alert
//
//  Created by 이정찬 on 2022/05/20.
//

import UIKit

class ViewController: UIViewController {
    
    //이미지들의 상수
    let imgOn = UIImage(named: "Image1.jpeg")
    let imgOff = UIImage(named: "Image2.png")
    let imgRemove = UIImage(named: "Image3.jpeg")
    
    //1번 사진임을 나타내느 상수
    var isLampOn = true

    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){
            //1번 사진일 경우, 이미 1번 사진임을 알려주는 얼럿 실행
            let lampOnAlert = UIAlertController(title: "경고", message: "이미 1번 사진입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title:"네, 알겠습니다.", style:UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
            
        }else {
            //1번 사진이 아닐경우 1번 사진을 보여줌
            lampImg.image = imgOn
            isLampOn=true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if(isLampOn == true) {
            //1번 사진을경우, 2번으로 이동할지 묻는 얼럿 실행
            let lampOffAlert = UIAlertController(
                    title: "2번 사진",
                    message: "2번 사진을 보시겠습니까?",
                    preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(
                    title: "네",
                    style: UIAlertAction.Style.default,
                    handler: {
                        ACTION in self.lampImg.image = self.imgOff
                        self.isLampOn = false
            })
            let cancelAction = UIAlertAction(
                    title: "아니오",
                    style: UIAlertAction.Style.default,
                    handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion:nil)
        }else {
            lampImg.image = imgOff
            isLampOn = false
        }
    }
        //3번 사진으로 이동할것인지, 1번 혹은 2번 사진으로 이동할건지 선택
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(
                title: "3번 사진",
                message: "3번 사진을 보시겠습니까?",
                preferredStyle: UIAlertController.Style.alert
        )
        
        let offAction = UIAlertAction(
                title: "아니오 2번사진을 봅니다.",
                style: UIAlertAction.Style.default,
                handler:{
                    ACTION in self.lampImg.image = self.imgOff
                    self.isLampOn = false
                }
        )
        
        let onAction = UIAlertAction(
                title: "아니오 1번 사진을 봅니다.",
                style: UIAlertAction.Style.default,
                handler: {
                    ACTION in self.lampImg.image = self.imgOn
                    self.isLampOn = true
                }
        )
        
        let removeAction = UIAlertAction(
                title: "네",
                style: UIAlertAction.Style.default,
                handler: {
                    ACTION in self.lampImg.image = self.imgRemove
                }
            )
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

