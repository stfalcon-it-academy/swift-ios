//
//  Button.swift
//  Project2
//
//  Created by msm72 on 6/7/16.
//  Copyright © 2016 Paul Hudson. All rights reserved.
//

import UIKit

@IBDesignable class Button: UIButton {
    // MARK: - Properties
    let colors = [UIColor.blackColor().CGColor, UIColor.orangeColor().CGColor, UIColor.blueColor().CGColor]
    
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
    
    
    // MARK: - Class Functions
    func setup() {
        layer.borderWidth = 2
        layer.borderColor = colors[self.tag]
    }
    
    func changeImage(countries: [String]) {
        self.setImage(UIImage(named: countries[self.tag]), forState: .Normal)
    }
    
    func tapped(inout score: Int, correctAnswer: Int) -> String {
        var title: String
        
        if self.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }

        return title
    }
}
