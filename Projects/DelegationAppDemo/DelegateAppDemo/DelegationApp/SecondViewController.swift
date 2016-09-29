//
//  SecondViewController.swift
//  DelegationApp
//
//  Created by msm72 on 29.05.16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    func getLabelTextFrom(text: String)
}

class SecondViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var textField: UITextField!
    var delegate: SecondViewControllerDelegate?
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("SecondViewController deinit and now is nil.")
    }
    

    // MARK: - Actions
    @IBAction func handlerReturnButtonTap(sender: UIButton) {
        delegate?.getLabelTextFrom(textField.text!)
        
        navigationController?.popViewControllerAnimated(true)
    }
}
