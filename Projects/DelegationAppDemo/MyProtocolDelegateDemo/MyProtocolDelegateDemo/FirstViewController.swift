//
//  FirstViewController.swift
//  MyProtocolDelegateDemo
//
//  Created by msm72 on 7/18/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var userLabel: UILabel!

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Transition
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSecondVC" {
            let secondVC = segue.destinationViewController as! SecondViewController
            secondVC.delegate = self
        }
    }
}


// MARK: - SecondViewControllerDelegate
extension FirstViewController: SecondViewControllerDelegate {
    func setResultOfBusinessLogic(sentValue: String) {
        userLabel.text = sentValue
    }
}

