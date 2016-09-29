//
//  ViewController.swift
//  SettingsTest
//
//  Created by Abhishek Mishra on 15/06/2015.
//  Copyright © 2015 asm technology ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults()
        let registrationDictionary:[String: String] = ["user_name": "Paul Woods", "user_age": "29"]
        
        userDefaults.registerDefaults(registrationDictionary)
        userDefaults.synchronize()
        
        nameLabel.text = userDefaults.valueForKey("user_name") as? String
        ageLabel.text = userDefaults.valueForKey("user_age") as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

