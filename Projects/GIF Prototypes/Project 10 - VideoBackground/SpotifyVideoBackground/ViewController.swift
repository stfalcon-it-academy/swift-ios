//
//  ViewController.swift
//  SpotifyVideoBackground
//
//  Created by Allen on 16/1/16.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {
    // MARK: - Properties
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupVideoBackground()
        
        loginButton.layer.cornerRadius = 4
        signupButton.layer.cornerRadius = 4
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    // MARK: - Custom Functions
    func setupVideoBackground() {
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.userInteractionEnabled = false
    }
}

