//
//  ViewController.swift
//  CloudKitKVSDemo
//
//  Created by msm72 on 7/16/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var iCloudKeyStore: NSUbiquitousKeyValueStore? = NSUbiquitousKeyValueStore()
    let iCloudTextKey = "iCloudText"
    
    @IBOutlet weak var textField: UITextField!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add observers
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(iCloudSetUp), name:  NSUbiquitousKeyValueStoreDidChangeExternallyNotification, object: iCloudKeyStore)
        
        // Delegates
        textField.delegate = self
        
        iCloudSetUp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Custom Functions
    func iCloudSetUp() {
        let savedString = iCloudKeyStore?.stringForKey(iCloudTextKey)
        
        guard savedString != nil else {
            print(#function + ": textField.text = nil")
            
            return
        }
        
        textField.text = savedString!
        
        print(#function + ": textField.text = \(textField.text!)")
    }
    
    func saveToiCloud() {
        iCloudKeyStore?.setString(textField.text, forKey: iCloudTextKey)
        
        iCloudKeyStore?.synchronize()
        
        print(#function + ": textField.text = \(textField.text!)")
    }
    
//    func ubiquitousKeyValueStoreDidChangeExternally() {
//        iCloudSetUp()
//        
//        //textField.text = iCloudKeyStore?.stringForKey(iCloudTextKey)
//
//        //print(#function + ": textField.text = \(textField.text!)")
//    }
}


// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if ((textField.text?.isEmpty) != nil) {
            textField.resignFirstResponder()
            saveToiCloud()
            
            return true
        }
        
        return false
    }
}