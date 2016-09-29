//
//  ViewController.swift
//  IOS8SwiftNSUserDefaultsTutorial
//
//  Created by Arthur Knopper on 22/02/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var bluetoothSwitch: UISwitch!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("SwitchState") != nil) {
            bluetoothSwitch.on = defaults.boolForKey("SwitchState")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func saveSwitchState(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setBool(bluetoothSwitch.on ? true : false, forKey: "SwitchState")
    }
}

