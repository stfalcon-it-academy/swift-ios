//
//  CustomButton.swift
//  SketchPrototypeDemo
//
//  Created by msm72 on 6/20/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    // MARK: - Properties
//    let _border = CAShapeLayer()

    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(CGColor: self.layer.borderColor!)
        }
        
        set {
            self.layer.borderColor = newValue.CGColor
        }
    }
    
    
//    // MARK: - Initialization
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        setup()
//    }
//
//    init() {
//        super.init(frame: CGRectZero)
//        
//        setup()
//    }
//
//    func setup() {
//        _border.strokeColor = UIColor.whiteColor().CGColor
//        _border.fillColor = nil
//        _border.lineDashPattern = [4, 4]
//        self.layer.addSublayer(_border)
//    }
}
