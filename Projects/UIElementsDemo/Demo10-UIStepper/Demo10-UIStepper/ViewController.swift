//
//  ViewController.swift
//  Demo10-UIStepper
//
//  Created by Prashant on 28/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!

    @IBOutlet var stepper1: UIStepper!
    @IBOutlet var stepper2: UIStepper!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


    // MARK: - Actions
    @IBAction func stepper1Action(sender: UIStepper) {
        counterLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func stepper2Action(sender: UIStepper) {
        messageLabel.font = UIFont(name: messageLabel.font.fontName, size: CGFloat(stepper2.value))
    }
}

