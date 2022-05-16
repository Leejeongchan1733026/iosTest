//
//  ViewController.swift
//  imageView
//
//  Created by 이정찬 on 2022/05/16.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "Image1.jpeg")
        imgOff = UIImage(named: "Image2.png")
        
        imgView.image = imgOn
    }

    @IBAction func btnResizeimage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeigth:CGFloat
        
        if(isZoom) {
            newWidth = imgView.frame.width/scale
            newHeigth = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        } else {
            newWidth = imgView.frame.width*scale
            newHeigth = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeigth)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
}

