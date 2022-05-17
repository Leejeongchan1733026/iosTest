//
//  ViewController.swift
//  DarePicker
//
//  Created by 이정찬 on 2022/05/17.
//

import UIKit

class ViewController: UIViewController {
    //타이머가 구동되면 실행할 함수
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0      //타이머 간격 1초
    var count = 0       //타이머가 설정한 간격대로 실행되는지 확인하는 변수

    @IBOutlet var IbICurrentTime: UILabel!  //현재시간 레이블의 아웃렛 변수
    @IBOutlet var IbIPickerTime: UILabel!   //선택시간 레이블의 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender     //전달된 인수 저장
        
        let formatter = DateFormatter() //DateFormatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"   //formatter의 dateFormat 속성을 설정
        IbIPickerTime.text = "선택시간 : " + formatter.string(from : datePickerView.date)   //데이트 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열로 변환
    }
    
    @objc func updateTime() {
        // count 값을 문자열로 변환하여 IbICurrnetTime.text에 출력하는 테스트용
/*      IbICurrentTime.text = String(count)
        count = count + 1
*/
        let date = NSDate() //현재 시간을 가져옴
        
        //상수 formatter의 dateFormat 속성을 설정
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        /* 현재 날짜(date)를 formatter의 dateFormat에서 설정한 포맷대로
           string 메서드를 사용하여 문자열로 변환 후 변환한 date값을 "현재시간:"이라는 문자열에 추가
           그리고 그 문자열을 IbICurrentTime에 입력 */
        IbICurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    }
}

