//
//  ViewController.swift
//  SettingsBundleDemo
//
//  Created by msm72 on 7/11/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var roomForCream: UISwitch!
    @IBOutlet weak var drinkText: UITextField!
    @IBOutlet weak var sizeSegment: UISegmentedControl!

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        registerSettingsBundle()
        updateDisplayFromDefaults()
        
        // Add observers
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(defaultsChanged), name: NSUserDefaultsDidChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Not needed for iOS9 and above. ARC deals with the observer.
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    // MARK: - Custom Functions
    func registerSettingsBundle(){
        let appDefaults = [String: AnyObject]()
        
        NSUserDefaults.standardUserDefaults().registerDefaults(appDefaults)
    }
    
    func updateDisplayFromDefaults(){
        // Get the defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        
        // Set the controls to the default values.
        roomForCream.on = defaults.boolForKey("coffee_cream")
        
        if let drink = defaults.stringForKey("coffee_type") {
            drinkText.text = drink
        } else {
            drinkText.text = ""
        }
        
        sizeSegment.selectedSegmentIndex = defaults.integerForKey("coffee_size")
    }
    
    func defaultsChanged(){
        updateDisplayFromDefaults()
    }
}

