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
      
      override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            let location = CLLocationCoordinate2D(latitude: 35.166043, longitude: 129.070564)
            let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
            let region = MKCoordinateRegion(center: location, span: span)
            
            myMapView.setRegion(region, animated: true)
            
            //annotation 추가 (핀)
            let loc01 = CLLocationCoordinate2D(latitude: 35.167809, longitude: 129.070555)
            let anno01 = MKPointAnnotation()
            anno01.coordinate = loc01
            anno01.title = "번개반점"
            anno01.subtitle = "부산광역시 부산진구 양정1동 418-260"
            myMapView.addAnnotation(anno01)
            
            let anno02 = MKPointAnnotation()
            anno02.coordinate = location
            anno02.title = "동의과학대"
            anno02.subtitle = "안녕하세요"
            myMapView.addAnnotation(anno02)
      }



}

