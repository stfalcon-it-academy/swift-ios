//
//  AppDelegate.swift
//  DeepLinkDemo2
//
//  Created by msm72 on 8/1/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var currentVC: UIViewController!


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        self.currentVC = self.window!.rootViewController
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


    // MARK: - Deeplinking
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)

        if url.host == "page" {
            if url.path == "/main" {
                let mainVC = storyboard.instantiateViewControllerWithIdentifier("MainVC")
                
                if mainVC == self.currentVC {
                    self.window!.rootViewController = mainVC
                    self.window!.makeKeyAndVisible()
                } else {
                    self.currentVC.dismissViewControllerAnimated(true, completion: nil)
                }
            } else if url.path == "/page1" {
                let page1VC = storyboard.instantiateViewControllerWithIdentifier("Page1VC")
                
                self.window!.rootViewController?.presentViewController(page1VC, animated: true, completion: nil)
            } else if url.path == "/page2" {
                let page2VC = storyboard.instantiateViewControllerWithIdentifier("Page2VC")
                
                self.window!.rootViewController?.presentViewController(page2VC, animated: true, completion: nil)
            } else if url.path == "/page3" {
                let page3VC = storyboard.instantiateViewControllerWithIdentifier("Page3VC")
                
                self.window!.rootViewController?.presentViewController(page3VC, animated: true, completion: nil)
            }
            
            return true
        } else {
            return false
        }
    }
}

