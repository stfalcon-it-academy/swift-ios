//
//  Button.swift
//  NavBarDemo
//
//  Created by msm72 on 6/8/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class Button: UIButton {
    // MARK: - Properties
    var detailVC: UIViewController?
    

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
    func setup() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       
        if self.tag == 0 {
            detailVC = storyboard.instantiateViewControllerWithIdentifier("PizzaDetailVC")
            detailVC!.navigationItem.title = "Pizza View Controller"
        } else {
            detailVC = storyboard.instantiateViewControllerWithIdentifier("PastaNC")
        }
    }
}
