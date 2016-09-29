//
//  ViewController.swift
//  Demo3-UISegmentedControl
//
//  Created by Prashant on 25/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var priorityList: [String] = ["Low", "Medium", "High"]
    var genderList: [String] = ["Male", "Female"]
    
    @IBOutlet var prioritySegControl: UISegmentedControl!
    @IBOutlet var priorityLabel: UILabel!
    @IBOutlet var genderImageView: UIImageView!
    @IBOutlet var genderSegControl: UISegmentedControl!
    @IBOutlet var genderLabel: UILabel!

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        priorityLabel.text = priorityList[prioritySegControl.selectedSegmentIndex]
        let genderName: String = genderList[genderSegControl.selectedSegmentIndex]
        genderImageView.image = UIImage(named: genderName)
        genderLabel.text = genderName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Actions
    @IBAction func segmentedControlChangedValue(sender: UISegmentedControl) {
        switch sender.tag {
        // Gender segmented control
        case 1:
            let genderName: String = genderList[sender.selectedSegmentIndex]
            genderImageView.image = UIImage(named: genderName)
            genderLabel.text = genderName
        
        // Priority segmented control
        default:
            priorityLabel.text  = priorityList[sender.selectedSegmentIndex]
        }
    }
}

