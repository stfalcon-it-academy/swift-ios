//
//  ViewController.swift
//  SocialApp
//
//  Created by msm72 on 6/12/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Actions
    @IBAction func handlerActionButtonTap(sender: AnyObject) {
        switch sender.tag {
        // Twitter
        case 1:
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) && sender.tag == 1 {
                let tweetShare = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                
                self.presentViewController(tweetShare, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to tweet.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
            }

        // Facebook
        default:
            if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) && sender.tag == 0 {
                let fbShare = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                
                self.presentViewController(fbShare, animated: true, completion: nil)
                
            } else {
                let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
}
