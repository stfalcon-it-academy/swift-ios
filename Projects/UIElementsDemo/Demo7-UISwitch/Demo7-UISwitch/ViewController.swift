//
//  ViewController.swift
//  Demo7-UISwitch
//
//  Created by Prashant on 27/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var displayText: String = "Not Ready"
    
    @IBOutlet var readySwitch: UISwitch!
    @IBOutlet var sizeSwitch: UISwitch!
    @IBOutlet var colorSwitch: UILabel!
    @IBOutlet var bracketSwitch: UISwitch!
    @IBOutlet var displayLabel: UILabel!
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    // MARK: - Actions
    @IBAction func readySwitchAction(sender: UISwitch) {
        if sender.on {
            displayText = "Ready"
        } else {
            displayText = "Not Ready"
        }
        
        if bracketSwitch.on {
            displayLabel.text = "( " + self.displayText + " )"
        } else {
            displayLabel.text = displayText
        }
    }
    
    @IBAction func sizeSwitchAction(sender: UISwitch) {
        if sender.on {
            displayLabel.font = UIFont(name: displayLabel.font.fontName, size: CGFloat(40))
        } else {
            displayLabel.font = UIFont(name: displayLabel.font.fontName, size: CGFloat(20))
        }
    }
    
    @IBAction func colorSwitchAction(sender: UISwitch) {
        if sender.on {
            displayLabel.textColor = UIColor.redColor()
        } else {
            displayLabel.textColor = UIColor.blackColor()
        }
    }
    
    @IBAction func bracketSwitchAction(sender: UISwitch) {
        if sender.on {
            displayLabel.text = "( " + displayText + " )"
        } else {
            displayLabel.text = displayText
        }
    }
}

