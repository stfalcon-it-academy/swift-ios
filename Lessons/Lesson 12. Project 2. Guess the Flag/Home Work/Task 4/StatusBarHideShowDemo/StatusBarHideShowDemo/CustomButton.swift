//
//  CustomButton.swift
//  StatusBarHideShowDemo
//
//  Created by msm72 on 6/9/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    // MARK: - Custom Functions
    func changeTitle() {
        self.setTitle(UIApplication.sharedApplication().statusBarHidden ? "Show status bar" : "Hide status bar", forState: .Normal)
    }
}
