//
//  ViewController.swift
//  map
//
//  Created by yuuya on 2015/11/15.
//  Copyright © 2015年 yuuya. All rights reserved.
//

import UIKit
import MapKit




class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var adressTextField: UITextField!
    @IBOutlet var revueTextField: UITextField!
    @IBOutlet var categoryTextField: UITextField!
    @IBOutlet var webTextField: UITextField!
    @IBOutlet var hourTextField: UITextField!
    var shopNumber: Int = 0
    
    var nameArray: [String]
    var latitudeArray: [Double]
    var revueArray: [String]
    var categoryArray: [String]
    var webArray: [String]
    var hourArray: [Int]
    
    
    
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        adressTextField.delegate = self
        categoryTextField.delegate = self
        revueTextField.delegate = self
        webTextField.delegate = self
        hourTextField.delegate = self
        
        nameTextField.tag = 1
        adressTextField.tag = 2
        categoryTextField.tag = 3
        revueTextField.tag = 4
        webTextField.tag = 5
        hourTextField.tag = 6
        
        saveData.registerDefaults(["shopNumber":0])
        shopNumber = saveData.integerForKey("shopNumber")+1
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OK() {
        performSegueWithIdentifier("goMap", sender: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        
        
        switch textField.tag
        {
        case 1:
            saveData.setObject(nameTextField.text, forKey: "name")
            break
            
        case 2:
            
            let address = adressTextField.text
            let geocoder = CLGeocoder()
            
            geocoder.geocodeAddressString(address!, completionHandler: {(placemarks, error) -> Void in
                if((error) != nil){
                    print("Error", error)
                }
                if let placemark = placemarks?.first {
                    let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                    print(coordinates.latitude)
                    print(coordinates.longitude)
                    self.saveData.setObject(coordinates.latitude, forKey: "Latitude")
                    self.saveData.setObject(coordinates.longitude, forKey: "Longitude")
                    
                }
            })
            break
            
        case 3:saveData.setObject(textField.text, forKey: "category")
            break
            
        case 4:
              saveData.setObject(revueTextField.text, forKey: "revue")
            break
            
        case 5:saveData.setObject(textField.text, forKey: "web")
            break
            
        case 6:saveData.setObject(textField.text, forKey: "hour")
            break
        default:
            break
        }
        
        
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    
    
    
}

