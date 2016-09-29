//
//  ViewController.swift
//  Demo6-UISlider
//
//  Created by Prashant on 27/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var myLabel1: UILabel!
    @IBOutlet var myLabel2: UILabel!

    @IBOutlet var mySlider1: UISlider!
    @IBOutlet var mySlider2: UISlider!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set value for label1
        myLabel1.text = "\(Int(mySlider1.value))"
        
        // Set font size for label2
        let currentValue = CGFloat(mySlider2.value)
        myLabel2.font = UIFont(name: myLabel2.font.fontName, size: currentValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    // MARK: - Actions
    @IBAction func mySlider1Action(sender: UISlider) {
        myLabel1.text = "\(Int(sender.value))"
    }
    
    @IBAction func mySlider2Action(sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        myLabel2.font = UIFont(name: myLabel2.font.fontName, size: currentValue)
    }
}

