//
//  MapViewController.swift
//  map
//
//  Created by yuuya on 2015/12/13.
//  Copyright © 2015年 yuuya. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController{
    
    var saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet var mapview: MKMapView!
    
    var myPin: MKPointAnnotation = MKPointAnnotation()
    
    override func viewDidLoad (){
        super.viewDidLoad()
        mapview.frame = self.view.frame
        
        
        
        let myLatitude: CLLocationDegrees = self.saveData.objectForKey("Latitude") as! Double
        
        let myLongitude:CLLocationDegrees = self.saveData.objectForKey("Longitude")as! Double
        
        let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLatitude,myLongitude)
        
        mapview.setCenterCoordinate(center, animated: true)
        
        let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let myRegion: MKCoordinateRegion = MKCoordinateRegionMake(center, mySpan)
        
        
        mapview.region = myRegion
        
        self.view.addSubview(mapview)
        
        
        myPin.coordinate = center
        
        myPin.title = saveData.objectForKey("name") as! String
        myPin.subtitle = saveData.objectForKey("revue") as! String
        
        mapview.addAnnotation(myPin)
        
    }
        


}
