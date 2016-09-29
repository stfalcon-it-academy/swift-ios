//
//  ViewController.swift
//  DeepLinkDemo2
//
//  Created by msm72 on 8/1/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: - Actions
    @IBAction func handlerButtonPage1Tap(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "dlapplink://page/page1")!)
    }

    @IBAction func handlerButtonPage2Tap(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "dlapplink://page/page2")!)
    }
    
    @IBAction func handlerButtonPage3Tap(sender: UIButton) {
        UIApplication.sharedApplication().openURL(NSURL(string: "dlapplink://page/page3")!)    
    }
}

