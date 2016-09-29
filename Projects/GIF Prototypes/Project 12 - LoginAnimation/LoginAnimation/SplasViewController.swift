//
//  SplasViewController.swift
//  LoginAnimation
//
//  Created by Allen on 16/1/18.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

class SplasViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

