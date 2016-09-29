//
//  ViewController.swift
//  StatusBarHideShowDemo
//
//  Created by msm72 on 6/9/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var actionButton: CustomButton!
    var isStatusBarHide = false
    var statusBarViewPositionY: CGFloat = 0
    var statusBarBackgroundView = UIView()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusBarBackgroundView = UIView(frame: CGRectMake(0, statusBarViewPositionY, self.view.frame.size.width, 20))
        statusBarBackgroundView.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(statusBarBackgroundView)

        navigationController?.hidesBarsOnTap = true
        actionButton.changeTitle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    @IBAction func handlerActionButtonTap(sender: CustomButton) {
        isStatusBarHide = !isStatusBarHide
        statusBarViewPositionY = isStatusBarHide ? -20 : 0
        
        UIView.animateWithDuration(3.5) {
            self.setNeedsStatusBarAppearanceUpdate()
//            self.statusBarBackgroundView.frame.origin.y = self.statusBarViewPositionY
            self.statusBarBackgroundView.alpha = self.isStatusBarHide ? 0 : 1
            sender.changeTitle()
        }
    }
}


extension ViewController {
    override func prefersStatusBarHidden() -> Bool {
        return isStatusBarHide
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Fade
    }

}
