//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 이정찬 on 2022/05/29.
//

import UIKit
import MobileCoreServices //ios에서 사용하는 모든 데이터 타입을 정의한 헤더 파일

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate { // 델리게이트 추가

    @IBOutlet var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController() //인스턴트 변수 생성
    var captureImage: UIImage! //촬영 혹은 불러올 사진을 저장할 함수
    var videoURL: URL! //녹화한 영상의 URL을 저장할 변수
    var flagImageSave = false //이미지 저장 여부를 나타낼 함수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){ //카메라 사용 여부 확인
            flagImageSave = true //이미지 저장을 허용
            
            imagePicker.delegate = self //delegate를 self로 설정
            imagePicker.sourceType = .camera //sourceType을 카메라로 설정
            imagePicker.mediaTypes = ["public.image"] //mediaType을 public.image로 설정
            imagePicker.allowsEditing = false // 편집 불허
            
            present(imagePicker, animated: true, completion: nil) //현재 뷰를 imagePicker로 대처
        } else { //카메라 사용이 불가능 할 때
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")//경고 표시
        }
    }
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album")
        }
    }
    @IBAction func btnRecordVideoFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera")
        }
    }
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false

            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert("Video album inaccessable", message: "Application cannot access the video album")
        }
    }
    
    // 경고창을 띄우는 함수
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString //미디어 종류 확인
        
        if mediaType.isEqual(to: "pubic.image" as String) { // 미디어 종류가 이미지일 경우
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage //사진을 cptureImage에 저장
            
            //성공이면 포토라이브러리에 저장
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage //뷰 컨트롤러에 할당
        } else if mediaType.isEqual(to: "public.movie" as String) {//미디어 종류가 비디오인 경우

            if flagImageSave {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL) //비디오의 URL을 videoURL에 저장
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)//비디오를 포토 라이브러리에 저장
            }
        }
        
        self.dismiss(animated: true, completion: nil)//현재의 뷰를 제거하고, 초기 뷰로 전환
    }
    
    //취소를 하는 경우, 현재 뷰를 제거하고 초기 뷰로 전환
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

