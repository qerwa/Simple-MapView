//
//  ViewController.swift
//  Simple MapView
//
//  Created by D7703_17 on 2018. 6. 4..
//  Copyright © 2018년 D7703_17. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
      @IBOutlet weak var myMapView: MKMapView!
      
      //pin 객체 저장
      var annotations = [MKPointAnnotation]()
      var count = 0
      
      override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            
            let location = CLLocationCoordinate2D(latitude: 35.166043, longitude: 129.070564)
//            let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
//            let region = MKCoordinateRegion(center: location, span: span)
//            myMapView.setRegion(region, animated: true)
            let region = MKCoordinateRegionMakeWithDistance(location, 500, 500)
            myMapView.setRegion(region, animated: true)
            
            
//            //annotation 추가 (핀)
//            let loc01 = CLLocationCoordinate2D(latitude: 35.167809, longitude: 129.070555)
//            let anno01 = MKPointAnnotation()
//            anno01.coordinate = loc01
//            anno01.title = "번개반점"
//            anno01.subtitle = "부산광역시 부산진구 양정1동 418-260"
//            myMapView.addAnnotation(anno01)
//
//
//            let anno02 = MKPointAnnotation()
//            anno02.coordinate = location
//            anno02.title = "동의과학대"
//            anno02.subtitle = "안녕하세요"
//            myMapView.addAnnotation(anno02)
//
////            부산광역시 부산진구 양정동 366-1,051-852-0552
////            35.168092, 129.070367
//            let loc02 = CLLocationCoordinate2D(latitude: 35.168092, longitude: 129.070367)
//            let anno03 = MKPointAnnotation()
//            anno03.coordinate = loc02
//            anno03.title = "토마토도시락"
//            anno03.subtitle = "부산광역시 부산진구 양정동 366-1"
//            myMapView.addAnnotation(anno03)
            
            ////번개반점의 주소를 위도, 경도로 변환 : geocoding
            //let addr = "부산광역시 부산진구 양정1동 418-260"
            
            let foodStoreLocation = ["부산광역시 부산진구 양정동 350-1",
                                     "부산광역시 부산진구 양정동 418-282",
                                     "부산광역시 부산진구 양정1동 393-18",
                                     "부산광역시 부산진구 양정1동 356-22",
                                     "부산광역시 부산진구 양정1동 산19-8",
                                     "부산광역시 부산진구 양정동 353-38",
                                     "부산광역시 부산진구 양정동 429-19"]
            let foodStoreNames = ["동의과학대학교", "늘해랑", "아딸", "왕짜장", "토마토 도시락",  "홍콩반점","번개반점"]
            for addr in foodStoreLocation {
                  let geoCoder = CLGeocoder()
                  geoCoder.geocodeAddressString(addr) {
                        (placemarks:[CLPlacemark]?, error : Error?) -> Void in
                        if let myError = error{
                              print(myError)
                              return
                        }
                        if let myPlacemarks = placemarks {
                              let myPlacemarks = myPlacemarks[0]
                              let loc = myPlacemarks.location?.coordinate
                              
                              let anno = MKPointAnnotation()
                              anno.coordinate = loc!
                              anno.title = foodStoreNames[self.count]
                              self.count = self.count + 1
                              anno.subtitle = addr
                              //self.myMapView.addAnnotation(anno)
                              self.annotations.append(anno)
                              self.myMapView.addAnnotations(self.annotations)
                              
                              //여러개의 pin을 지도에 꽉채움
                              self.myMapView.showAnnotations(self.annotations, animated: true)

                        } else {
                              print("placemarks nil발생")
                        }
                  }
            }
}
}
