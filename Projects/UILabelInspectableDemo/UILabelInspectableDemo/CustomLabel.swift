//
//  CustomLabel.swift
//  UILabelInspectableDemo
//
//  Created by msm72 on 6/18/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

@IBDesignable class CustomLabel: UILabel {
    // MARK: - Properties
    @IBInspectable var fontType: Int = 0 {
        didSet {
            switch fontType {
            case 1:
                self.font = UIFont(name: "HelveticaNeue-Italic", size: 130)
                self.textColor = UIColor.orangeColor()
           
            case 2:
                self.font = UIFont(name: "HelveticaNeue-Bold", size: 50)
                self.textColor = UIColor.redColor()

            case 3:
                self.font = UIFont(name: "Menlo", size: 103)
                self.textColor = UIColor(hexString: "#ffe700ff")

            default:
                break
//                self.font = UIFont(name: "HelveticaNeue", size: 17)
            }
        }
    }
}



// MARK: - UIColor
extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.startIndex.advancedBy(1)
            let hexColor = hexString.substringFromIndex(start)
            
            if hexColor.characters.count == 8 {
                let scanner = NSScanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexLongLong(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
