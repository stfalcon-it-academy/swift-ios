//
//  HomeViewController.swift
//  SketchPrototypeDemo
//
//  Created by msm72 on 6/20/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func unwindToHome(segue: UIStoryboardSegue) { }
}

