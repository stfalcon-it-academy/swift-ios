//
//  ViewController.swift
//  HelloWorld
//
//  Created by Simon Ng on 5/8/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var helloButton: UIButton!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Customize hello button
        helloButton.layer.cornerRadius = 18
        
        // sets the color of the shadow, and needs to be a CGColor
        helloButton.layer.shadowColor = UIColor.blackColor().CGColor
        
        // sets how transparent the shadow is, where 0 is invisible and 1 is as strong as possible
        helloButton.layer.shadowOpacity = 1.4
        
        // sets how far away from the view the shadow should be, to give a 3D offset effect
        helloButton.layer.shadowOffset = CGSizeZero
        
        // sets how wide the shadow should be
        helloButton.layer.shadowRadius = 10
        
        // creates a shadow path equivalent to the frame of the view
        helloButton.layer.shadowPath = UIBezierPath(rect: helloButton.bounds).CGPath
        
        // ask iOS to cache the rendered shadow so that it doesn't need to be redrawn
        helloButton.layer.shouldRasterize = true
        
        helloButton.layer.needsLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Actions
    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}
