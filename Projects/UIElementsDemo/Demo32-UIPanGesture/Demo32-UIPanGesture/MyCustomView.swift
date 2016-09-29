//
//  MyCustomView.swift
//  Demo32-UIPanGesture
//
//  Created by Prashant on 15/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class MyCustomView: UIView {
    // MARK: - Properties
    // last location for view
    var lastSavedLocation = CGPointZero
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // set corner radious and border thickness
        self.layer.cornerRadius = 12.5
        self.layer.borderWidth = 1.0
        
        // add pan gesture to view
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        self.addGestureRecognizer(panGesture)
        
        // set view background color randomly
        let myRed = CGFloat((arc4random_uniform(255) + 100)  / 255)
        let myGreen = CGFloat((arc4random_uniform(255) + 100) / 255)
        let myBlue = CGFloat((arc4random_uniform(255) + 100) / 255)
        self.backgroundColor = UIColor(red: myRed, green: myGreen, blue: myBlue, alpha: 1.0)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Class Functions
    // detect touch for the current view and change last save postion
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // move touched view to front.
        self.superview?.bringSubviewToFront(self)
        
        // save view location
        lastSavedLocation = self.center
    }

    
    // MARK: - Custom Functions
    func handlePanGesture(gesture: UIPanGestureRecognizer) {
        // find translation in main view
        let newTranslation = gesture.translationInView(self.superview)
        
        // set current object to new position
        self.center = CGPointMake(self.lastSavedLocation.x + newTranslation.x , self.lastSavedLocation.y + newTranslation.y)
    }
}
