//
//  MapViewController.swift
//  map
//
//  Created by yuuya on 2015/12/13.
//  Copyright © 2015年 yuuya. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate{
    
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

    
    var myPin: [MKPointAnnotation] = [MKPointAnnotation]()
    
    override func viewDidLoad (){
        super.viewDidLoad()
        mapview.frame = self.view.frame
        
        shopNumber = saveData.integerForKey("shopNumber")
        print(String(shopNumber))
        
        print("Longitude"+String(self.shopNumber))
        
        
        
        
        
        
        if shopNumber == 1{
            var Pin = MKPointAnnotation()
            myPin.append(Pin)
            
            
            mapview.addAnnotation(myPin[0])
            
            
            
            myPin[0].title = saveData.objectForKey("name1") as! String
            myPin[0].subtitle = saveData.objectForKey("revue1") as! String
            
            print("Longitude"+String(self.shopNumber))
            
            let myLatitude: CLLocationDegrees = self.saveData.objectForKey("Latitude1")as! Double
            
            let myLongitude:CLLocationDegrees = self.saveData.objectForKey("Longitude1")as! Double
            
            
            
            let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLatitude,myLongitude)
            
            mapview.setCenterCoordinate(center, animated: true)
            
            let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let myRegion: MKCoordinateRegion = MKCoordinateRegionMake(center, mySpan)
            
            
            mapview.region = myRegion
            
            self.view.addSubview(mapview)
            myPin[0].coordinate = center
            
            
        
        
        }else {
            for var i in 0 ... shopNumber-1{
                var Pin = MKPointAnnotation()
                myPin.append(Pin)
            }

            for var i in 1 ... shopNumber{
                
                print("Longitude"+String(i))
                
                
                
                
                let myLatitude: CLLocationDegrees = self.saveData.objectForKey("Latitude"+String(i)) as! Double
                
                let myLongitude:CLLocationDegrees = self.saveData.objectForKey("Longitude"+String(i))as! Double
                
                
                
                let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLatitude,myLongitude)
                
                mapview.setCenterCoordinate(center, animated: true)
                
                let mySpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let myRegion: MKCoordinateRegion = MKCoordinateRegionMake(center, mySpan)
                
                myPin[i-1].title = saveData.objectForKey("name"+String(i)) as! String
                myPin[i-1].subtitle = saveData.objectForKey("revue"+String(i)) as! String

                
                
                mapview.region = myRegion
                
                self.view.addSubview(mapview)
                myPin[i-1].coordinate = center
                
                 mapview.addAnnotation(myPin[i-1])
                
                
                }

        }
        }
    

    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}