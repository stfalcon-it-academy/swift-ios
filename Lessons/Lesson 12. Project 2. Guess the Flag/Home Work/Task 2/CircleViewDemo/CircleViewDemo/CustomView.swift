//
//  CustomView.swift
//  CircleViewDemo
//
//  Created by msm72 on 6/9/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
    // MARK: - Properties
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(CGColor: self.layer.borderColor!)
        }
        
        set {
            self.layer.borderColor = newValue?.CGColor
        }
    }
    
    enum ViewState {
        case Normal
        case Pressed
    }
    
    
    // MARK: - Custom Functions
    func changeAlphaByState(state: ViewState) {
        switch state {
        case .Pressed:
            self.alpha = 0.5
            
        default:
            self.alpha = 1
        }
    }
}
