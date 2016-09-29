//
//  CustomButton.swift
//  PhotoPicker
//
//  Created by msm72 on 29.05.16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

@IBDesignable public class CustomButton: UIButton {
    // MARK: - Properties
    @IBInspectable var borderColor: UIColor = UIColor.whiteColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    
    // MARK: - Custom Functions
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 0.5 * bounds.size.width
        clipsToBounds = true
        
        layer.borderColor = self.state == .Normal ? borderColor.CGColor : UIColor.blueColor().CGColor
    }
}