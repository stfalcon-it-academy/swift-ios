//
//  ViewController.swift
//  Demo2-UIButton
//
//  Created by Prashant on 25/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var clickCount: Int = 0

    @IBOutlet var clickCountLabel: UILabel!
    @IBOutlet var buttonClickMe: UIButton!
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickCount = 0
        clickCountLabel.text = "\(clickCount)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func buttonClickMeAction(sender: UIButton) {
        clickCount += 1
        clickCountLabel.text = "\(self.clickCount)"
    }
}

