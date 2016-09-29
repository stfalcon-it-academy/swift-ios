//
//  ViewController.swift
//  SocialTest
//
//  Created by Abhishek Mishra on 22/06/2015.
//  Copyright © 2015 asm technology ltd. All rights reserved.
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
    @IBAction func onFacebookShare(sender: AnyObject) {
        // Facebook share
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let facebookMessageComposer:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookMessageComposer.addURL(NSURL(string: "http://www.asmtechnology.com"))
            facebookMessageComposer.addImage(UIImage(named: "Petal"))
            
            self.presentViewController(facebookMessageComposer, animated: true, completion: nil)
        } else {
            let facebookNotConfiguredAlert = UIAlertController(title: "Facebook Not Configured", message: "Please setup a facebook account using your device's settings app.", preferredStyle: UIAlertControllerStyle.Alert)
            facebookNotConfiguredAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(facebookNotConfiguredAlert, animated: true, completion: nil)
        }
    }
    
    // Twitter share
    @IBAction func onTwitterShare(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let twitterMessageComposer:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterMessageComposer.setInitialText("Hey guys, Check out my first post using the iOS Social API! If you like this post, be sure to visit my website!")
            twitterMessageComposer.addURL(NSURL(string: "http://www.asmtechnology.com"))
            twitterMessageComposer.addImage(UIImage(named:"Petal"))
            
            // Compilation handler
            twitterMessageComposer.completionHandler = { (result:SLComposeViewControllerResult) in
                // place your code here
            }
                
            self.presentViewController(twitterMessageComposer, animated: true, completion: nil)
        } else {
            let twitterNotConfiguredAlert = UIAlertController(title: "Twitter Not Configured", message: "Please setup a twitter account using your device's settings app.", preferredStyle: UIAlertControllerStyle.Alert)
            twitterNotConfiguredAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(twitterNotConfiguredAlert, animated: true, completion: nil)
        }
    }
}
