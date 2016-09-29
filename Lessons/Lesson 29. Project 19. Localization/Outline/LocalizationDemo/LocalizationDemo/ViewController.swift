//
//  ViewController.swift
//  LocalizationDemo
//
//  Created by msm72 on 7/31/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userButton: UIButton!
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        self.localizeScene()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: - Actions
    @IBAction func handlerShowButtonTap(sender: UIButton) {
        let alertController = UIAlertController(title: NSLocalizedString("alertTitle", comment: ""), message: NSLocalizedString("alertMessage", comment: ""), preferredStyle: .Alert)

        let actionOk = UIAlertAction(title: NSLocalizedString("alertButtonOk", comment: "") , style: .Default, handler: { (action) -> Void in
            print(#function + ": button Ok pressed")
        })

        alertController.addAction(actionOk)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: - Custom Functions
    func localizeScene() {
        self.userLabel.text = NSLocalizedString("labelTitle", comment: "")
        self.userButton.setTitle(NSLocalizedString("buttonTitle", comment: ""), forState: .Normal)
    }
}

