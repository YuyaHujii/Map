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
    
    var lati : Double = 0;
    var long : Double = 0;
    
    
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
        print("最初"+String(shopNumber))

        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OK(sender: AnyObject) {
        
                
        print("保存前"+String(shopNumber))
        saveData.setObject(shopNumber, forKey: "shopNumber")
        
        
        saveData.setObject(nameTextField.text, forKey: "name"+String(shopNumber))
        print(nameTextField.text)
        
        saveData.setObject(categoryTextField.text, forKey: "category"+String(shopNumber))
        print(categoryTextField.text)
        saveData.setObject(revueTextField.text, forKey: "revue"+String(shopNumber))
        print(revueTextField.text)
        saveData.setObject(webTextField.text, forKey: "web"+String(shopNumber))
        print(webTextField.text)
        saveData.setObject(hourTextField.text, forKey: "hour"+String(shopNumber))
        print(hourTextField.text)
        
        self.saveData.setObject(lati, forKey: "Latitude")
        print(long)
        self.saveData.setObject(long, forKey: "Longitude")
        print(lati)


        
        performSegueWithIdentifier("go", sender: nil)
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        
        switch textField.tag
        {
        
            
        case 2:
            
            let address = adressTextField.text
            let geocoder = CLGeocoder()
            
            geocoder.geocodeAddressString(address!, completionHandler: {(placemarks, error) -> Void in
                if((error) != nil){
                    print("Error", error)
                }
                if let placemark = placemarks?.first {
                    let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                    self.lati = coordinates.latitude
                    print(coordinates.latitude)
                    self.long = coordinates.longitude
                    print(coordinates.longitude)
                    
                }
            })
            break
        default:break
        }

        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }

    
   }