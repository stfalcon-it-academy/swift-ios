//
//  ViewController.swift
//  DeepLink
//
//  Created by Brian Coleman on 2015-07-12.
//  Copyright (c) 2015 Brian Coleman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.triggerDeepLinkIfPresent()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

