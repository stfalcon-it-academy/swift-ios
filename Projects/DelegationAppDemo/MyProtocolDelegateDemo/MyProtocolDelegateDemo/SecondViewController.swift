//
//  SecondViewController.swift
//  MyProtocolDelegateDemo
//
//  Created by msm72 on 7/18/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    func setResultOfBusinessLogic(sentValue: String)
}

class SecondViewController: UIViewController {
    // MARK: - Properties
    var delegate: SecondViewControllerDelegate?
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "SecondVC"
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Set Delegate
        delegate?.setResultOfBusinessLogic("Second view Controller did viewed.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

