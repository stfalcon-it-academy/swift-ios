//
//  ViewController.swift
//  Demo20-UINavigationBar
//
//  Created by Prashant on 05/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
            
    // MARK: - Actions
    @IBAction func helpButtonAction(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("segueHelp", sender: self)
    }
    
    @IBAction func settingsButtonAction(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("segueSettings", sender: self)
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueHelp" {
            let destVc = segue.destinationViewController as! HelpViewController
            destVc.navigationItem.title = "Help"
        }

        if segue.identifier == "segueSettings" {
            let destVc = segue.destinationViewController as! SettingsViewController
            destVc.navigationItem.title = "Settings"
        }
    }
}

