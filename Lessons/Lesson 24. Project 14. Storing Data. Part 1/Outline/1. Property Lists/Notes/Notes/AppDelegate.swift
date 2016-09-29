//
//  AppDelegate.swift
//  Notes
//
//  Created by Malek T. on 5/28/15.
//  Copyright (c) 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Properties
    var window: UIWindow?
    var plistPathInDocument = String()

    
    // MARK: - Custom Functions
    func preparePlistForUse(){
        // 1
        let rootPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        
        // 2
//        plistPathInDocument = rootPath.stringByAppendingString("/sss.plist")
        plistPathInDocument = rootPath.stringByAppendingString("/notes.plist")
       
        if !NSFileManager.defaultManager().fileExistsAtPath(plistPathInDocument) {
//            let plistPathInBundle = NSBundle.mainBundle().pathForResource("sss", ofType: "plist") as String!
            let plistPathInBundle = String(NSBundle.mainBundle().pathForResource("notes", ofType: "plist")! ) //as String!
            
            // 3
            do {
                try NSFileManager.defaultManager().copyItemAtPath(plistPathInBundle, toPath: plistPathInDocument)
            } catch {
                print("Error occurred while copying file to document \(error)")
            }
        }
    }
    
    
    // MARK: - Class Functions
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Prepare the plist for writing mode, move it from the main bundle to the documents directory
        self.preparePlistForUse()

        return true
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
        // Prepare the plist for writing mode, move it from the main bundle to the documents directory
        self.preparePlistForUse()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

