//
//  ViewController.swift
//  Map
//
//  Created by 이정찬 on 2022/05/22.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() //위치 데이터를 추적하기 위해 사용자 요구
        locationManager.startUpdatingLocation() //위치 업데이트 시작
        myMap.showsUserLocation = true
    }

    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    //특정 위도와 경도에 핀 설치하고, 핀에 타이틀과 서브 타이틀의 문자열 표시
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double, title strTitle : String, subtitle strSubtitle:String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    //위치 정보에서 국가, 지역, 도로를 추출하여 레이블에 표시
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
       _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
                   longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += ""
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += ""
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
    })
        
        locationManager.stopUpdatingLocation()
    }
        
    //세그먼트 컨트롤을 선택하였을 때 호출
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            //"현재 위치" 선택 - 현재 위치 표시
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
            
        } else if sender.selectedSegmentIndex == 1{
            //"부천대학" 선택 - 핀을 설치하고 위치 정보 표시
            setAnnotation(latitudeValue: 37.489493, longitudeValue: 126.778669, delta: 0.01, title: "부천대학교 본캠퍼스", subtitle:"경기도 부천시 신흥로56번길 25")
            self.lblLocationInfo1.text = "보고 있는 위치"
            self.lblLocationInfo2.text = "부천대학교 본캠퍼스"
        } else {
            //"이지퍼블리싱" 선택 - 핀을 설치하고 위치 정보 표시
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.914066, delta: 0.01, title: "이지퍼블리싱", subtitle: "서울시 마포수 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 있는 위치"
            self.lblLocationInfo2.text = "이지퍼블리싱 출판사"
        }
    }
    
}
