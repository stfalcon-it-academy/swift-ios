//
//  ViewController.swift
//  NavBarDemo
//
//  Created by msm72 on 6/4/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

        navigationItem.title = "Main View Controller"
    }
    
    
    // MARK: - Transition
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = nil
        
        if segue.identifier == "pizza" {
            let destinationVC = segue.destinationViewController as UIViewController
            destinationVC.navigationItem.title = "Pizza View Controller"
            destinationVC.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        }
        
        if segue.identifier == "pasta" {
            let destinationNC = segue.destinationViewController as! UINavigationController
            let rootVC = destinationNC.topViewController!
            rootVC.navigationItem.title = "Pasta View Controller"
        }
    }
}
