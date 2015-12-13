//
//  MapViewController.swift
//  map
//
//  Created by yuuya on 2015/12/13.
//  Copyright © 2015年 yuuya. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var mapview: MKMapView!
    
    var myPin: MKPointAnnotation = MKPointAnnotation()
    
    override func viewDidLoad (){
        super.viewDidLoad()
        mapview.frame = self.view.frame
        
        
        
        let myLatitude: CLLocationDegrees = 35.68154
        let myLongtitude:CLLocationDegrees = 139.752498
        
        let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLatitude,myLongtitude)
        
        mapview.setCenterCoordinate(center, animated: true)
        
        let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let myRegion: MKCoordinateRegion = MKCoordinateRegionMake(center, mySpan)
        
        
        mapview.region = myRegion
        
        self.view.addSubview(mapview)
        
        
        myPin.coordinate = center
        
        myPin.title = "タイトル"
        myPin.subtitle = "サブタイトル"
        
        mapview.addAnnotation(myPin)
        
    }


}
