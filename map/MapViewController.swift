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
    
    var shopNumber: Int = 0
    var nameArray: [String] = []
    var latitudeArray: [Double] = []
    var longitudeArray: [Double] = []
    var revueArray: [String] = []
    var categoryArray: [String] = []
    var webArray: [String] = []
    var hourArray: [Int] = []

    
    var myPin: MKPointAnnotation = MKPointAnnotation()
    
    override func viewDidLoad (){
        super.viewDidLoad()
        mapview.frame = self.view.frame
        
        shopNumber = saveData.objectForKey("shopNumber") as! Int
        print(String(shopNumber))
        
        
        
        for i in 1 ... shopNumber {
            
            nameArray.append(self.saveData.objectForKey("name" + String(i))as! String)
            
            latitudeArray.append(self.saveData.objectForKey("latitude" + String(i))as! Double)
            
            longitudeArray.append(self.saveData.objectForKey("longitude" + String(i))as! Double)
            
            revueArray.append(self.saveData.objectForKey("revue" + String(i))as! String)
            
            categoryArray.append(self.saveData.objectForKey("category" + String(i))as! String)
            
            webArray.append(self.saveData.objectForKey("web" + String(i))as! String)
            
            hourArray.append(self.saveData.objectForKey("hour" + String(i))as! Int)
        }
        
        for i in 1 ... shopNumber {
            myPin.title = nameArray[i]
            myPin.subtitle = revueArray[i]
            let myLatitude: CLLocationDegrees = latitudeArray[i]
            
            let myLongitude:CLLocationDegrees = longitudeArray[i]
            
            
            
            let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLatitude,myLongitude)
            
            mapview.setCenterCoordinate(center, animated: true)
            
            let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let myRegion: MKCoordinateRegion = MKCoordinateRegionMake(center, mySpan)
            
            
            mapview.region = myRegion
            
            self.view.addSubview(mapview)
            
            
            myPin.coordinate = center
            
            
            
            mapview.addAnnotation(myPin)
            
        }    
        
    }

}
