//
//  CustomView.swift
//  XibDemo
//
//  Created by msm72 on 6/7/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
    // MARK: - Properties
    @IBOutlet weak var testLabel: UILabel!
    
    @IBInspectable var labelText: String {
        get {
            return testLabel.text!
        }
        
        set {
            self.testLabel.text = newValue
        }
    }
    
    var view: UIView!
    let nibName = "CustomView"
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    
    // MARK: - Custom Functions
    func loadFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil).first as! UIView
        
        return view
    }
    
    func setup() {
        view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        addSubview(view)
    }
}
