//
//  CustomButton.swift
//  CustomFont
//
//  Created by msm72 on 6/17/16.
//  Copyright © 2016 Allen. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    // MARK: - Propertes
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
}
