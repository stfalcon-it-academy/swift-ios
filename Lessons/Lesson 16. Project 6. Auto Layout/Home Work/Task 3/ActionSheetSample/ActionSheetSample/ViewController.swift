//
//  ViewController.swift
//  ActionSheetSample
//
//  Created by Abhishek Mishra on 25/09/2015.
//  Copyright © 2015 asm technology ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func onPresentActionSheet(sender: AnyObject) {
        let alert = UIAlertController(title: "Change background color", message: "Select a color", preferredStyle: .ActionSheet)
        
        alert.addAction(UIAlertAction(title: "Red", style: .Default, handler: { (action: UIAlertAction) -> Void in
            self.view.backgroundColor = UIColor.redColor()
        }))
        
        alert.addAction(UIAlertAction(title: "Green", style: .Default, handler: { (action: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.greenColor()
        }))
        
        alert.addAction(UIAlertAction(title: "Blue", style: .Default, handler: { (action: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.blueColor()
        }))
        
        alert.addAction(UIAlertAction(title: "Yellow", style: .Default, handler: { (action: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.yellowColor()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler:nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

