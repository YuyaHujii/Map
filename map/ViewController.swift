//
//  ViewController.swift
//  map
//
//  Created by yuuya on 2015/11/15.
//  Copyright © 2015年 yuuya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var aTextField: UITextField!
    @IBOutlet var bTextField: UITextField!
    @IBOutlet var cTextField: UITextField!
    @IBOutlet var dTextField: UITextField!
    @IBOutlet var eTextField: UITextField!
    @IBOutlet var fTextField: UITextField!
    var shopNumber: Int = 0
    var int num = 0
    
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aTextField.delegate = self
        bTextField.delegate = self
        cTextField.delegate = self
        dTextField.delegate = self
        eTextField.delegate = self
        fTextField.delegate = self
        
        aTextField.tag = 1
        bTextField.tag = 2
        cTextField.tag = 3
        dTextField.tag = 4
        eTextField.tag = 5
        fTextField.tag = 6
        
        saveData.registerDefaults(["shopNumber":0])
        shopNumber = saveData.integerForKey("shopNumber")+1
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OK() {
        saveData.setObject (aTextField.text, forKey: "map")
        saveData.synchronize()
        performSegueWithIdentifier("goMap", sender: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        var key = "ShopName"+String(shopNumber)
        
        switch textField.tag
        {
        case 1:
            saveData.setObject(textField.text, forKey: key)
            break
            
        case 2:saveData.setObject(textField.text, forKey: key)
            break
            
        case 3:saveData.setObject(textField.text, forKey: key)
            break
            
        case 4:saveData.setObject(textField.text, forKey: key)
            break
            
        case 5:saveData.setObject(textField.text, forKey: key)
            break
            
        case 6:saveData.setObject(textField.text, forKey: key)
            break
        default:
            break
        }
        
        
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    
    
    
}

