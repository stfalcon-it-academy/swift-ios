//
//  ShareViewController.swift
//  SketchPrototypeDemo
//
//  Created by msm72 on 6/20/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Actions
    @IBAction func handlerCloseButtonTap(sender: CustomButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}