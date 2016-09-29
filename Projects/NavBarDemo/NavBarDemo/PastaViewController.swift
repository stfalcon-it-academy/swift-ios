//
//  PastaViewController.swift
//  NavBarDemo
//
//  Created by msm72 on 6/8/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class PastaViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(handlerDoneBarButtonTap(_:)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    func handlerDoneBarButtonTap(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
