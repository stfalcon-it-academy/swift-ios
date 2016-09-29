//
//  AppDelegate.swift
//  CloudKitDemo
//
//  Created by Neil Smyth on 9/2/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import UIKit
import CloudKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Registering an App to Receive Push Notifications
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
        if let options: NSDictionary = launchOptions {
            let remoteNotification = options.objectForKey(UIApplicationLaunchOptionsRemoteNotificationKey) as? NSDictionary
            
            if let notification = remoteNotification {
                self.application(application, didReceiveRemoteNotification: notification as [NSObject : AnyObject])
            }
        }
        
        return true
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        let viewController: ViewController = self.window?.rootViewController as! ViewController
        let notification: CKNotification = CKNotification(fromRemoteNotificationDictionary: userInfo as! [String: NSObject])
        
        if (notification.notificationType == .Query) {
            let queryNotification = notification as! CKQueryNotification
            let recordID = queryNotification.recordID
            
            viewController.fetchRecord(recordID!)
        }
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

