//
//  ViewController.swift
//  MoviePlayer
//
//  Created by 이정찬 on 2022/05/27.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "gizmo", ofType: "mp4") // 비디오의 내부 파일 경로 저장
        let url = NSURL(fileURLWithPath: filePath!) //앱 내부의 파일명 형식을 NSURL로 변경
        playVideo(url: url)
        }
    
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = NSURL(string: "http://video.mrporter.com/videos/productPage/173037_detail.mp4")! //외부 링크 경로 저장
            playVideo(url: url)
        }
    
    private func playVideo(url: NSURL){
        let playerController = AVPlayerViewController() // 인스턴스 생성
        let player = AVPlayer(url: url as URL) // URL로 초기화된 인스턴스 생성
        playerController.player = player // 인스턴스 할당
        
        //비디오 실행
        self.present(playerController, animated: true) {
            player.play()
        }
    }
}

