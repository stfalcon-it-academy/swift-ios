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
    
    
    // MARK: - Actions
    @IBAction func handlerButtonTap(sender: Button) {
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "Back", style: .Plain, target: self, action: nil)

        if sender.tag == 0 {
            navigationController?.pushViewController(sender.detailVC!, animated: true)
        } else {
            let pastaNC = sender.detailVC! as! UINavigationController
            let pastaVC = pastaNC.topViewController as! PastaViewController
            pastaVC.navigationItem.title = "Pasta View Controller"

            self.presentViewController(sender.detailVC!, animated: true, completion: nil)
        }
    }
}
