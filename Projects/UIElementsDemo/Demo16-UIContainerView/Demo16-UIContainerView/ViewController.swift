//
//  ViewController.swift
//  Demo16-UIContainerView
//
//  Created by Prashant on 01/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var containerView1: UIView!
    @IBOutlet var containerView2: UIView!

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show first container at load time
        containerView1.hidden = false
        
        // hide second container at load time
        containerView2.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func segmentControlAction(sender: UISegmentedControl) {
        // Show/Hide container view based on segment control
        if sender.selectedSegmentIndex == 0 {
            containerView1.hidden = false
            containerView2.hidden = true
        } else if sender.selectedSegmentIndex == 1 {
            containerView1.hidden = true
            containerView2.hidden = false
        }
    }
}

