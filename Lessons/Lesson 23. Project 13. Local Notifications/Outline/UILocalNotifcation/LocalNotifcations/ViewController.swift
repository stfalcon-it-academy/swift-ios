//
//  ViewController.swift
//  LocalNotifcations
//
//  Created by Ivan Akulov on 28/03/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
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
    @IBAction func sendLocalNotification(sender: UIButton) {
        print(#function + ": notification will appear in 5 seconds")

        sendNotification()
    }

    
    // MARK: - Custom Functions
    func sendNotification() {
        let notification = UILocalNotification()
        
        notification.alertTitle = "alert title"
        notification.alertBody = "alert body"
        notification.alertAction = "run the app"
        notification.fireDate = NSDate(timeIntervalSinceNow: 5)
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
}

