//
//  ViewController.swift
//  Demo15-UIView
//
//  Created by Prashant on 30/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // outlet - view
    @IBOutlet var myView: UIView!
    
    // outlet - corder radious and border label
    @IBOutlet var corderRadiousLabel: UILabel!
    @IBOutlet var borderLabel: UILabel!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    // action - corder radious slider value changed
    @IBAction func cornerSliderAction(sender: UISlider) {
        // set corner radious from slider value
        myView.layer.cornerRadius = CGFloat(Int(sender.value))
        
        // set corner radious label
        corderRadiousLabel.text = "\(Int(sender.value))"
    }
    
    // action - border slider value changed
    @IBAction func borderSliderAction(sender: UISlider) {
        // set border width from slider value
        myView.layer.borderWidth = CGFloat(Int(sender.value))
        
        // set border label
        borderLabel.text = "\(Int(sender.value))"
    }
}

