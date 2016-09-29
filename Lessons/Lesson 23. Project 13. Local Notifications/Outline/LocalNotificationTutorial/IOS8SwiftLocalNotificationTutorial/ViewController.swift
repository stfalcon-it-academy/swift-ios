//
//  ViewController.swift
//  IOS8SwiftLocalNotificationTutorial
//
//  Created by Arthur Knopper on 27/01/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func sendNotification(sender: UIButton) {
        let localNotification = UILocalNotification()
     
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        localNotification.alertBody = "new Blog Posted at iOScreator.com"
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
}

