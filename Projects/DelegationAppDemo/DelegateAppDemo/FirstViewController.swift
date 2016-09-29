//
//  FirstViewController.swift
//  DelegationApp
//
//  Created by msm72 on 29.05.16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var label: UILabel!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSecondVC" {
            let destinationVC = segue.destinationViewController as? SecondViewController
            destinationVC?.delegate = self
            
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        }
    }
}


// MARK: - SecondViewControllerDelegate
extension FirstViewController: SecondViewControllerDelegate {
    func getLabelTextFrom(text: String) {
        label.text = text.isEmpty ? label.text : text
    }
}

