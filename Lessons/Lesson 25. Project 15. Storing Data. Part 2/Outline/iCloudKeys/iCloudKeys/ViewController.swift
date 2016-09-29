//
//  ViewController.swift
//  iCloudKeys
//
//  Created by Neil Smyth on 9/1/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var keyStore: NSUbiquitousKeyValueStore?
    @IBOutlet weak var textField: UITextField!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyStore = NSUbiquitousKeyValueStore()
        
        let storedString = keyStore?.stringForKey("MyString")
        
        if let stringValue = storedString {
            textField.text = stringValue
        }
        
        // Add observers
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ubiquitousKeyValueStoreDidChange(_:)), name: NSUbiquitousKeyValueStoreDidChangeExternallyNotification, object: keyStore)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func saveKey(sender: AnyObject) {
        keyStore?.setString(textField.text, forKey: "MyString")
        keyStore?.synchronize()
    }
    

    // MARK: - Custom Functions
    func ubiquitousKeyValueStoreDidChange(notification: NSNotification) {
        let alert = UIAlertController(title: "Change detected", message: "iCloud key-value-store change detected", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        textField.text = keyStore?.stringForKey("MyString")
    }
}

