//
//  ViewController.swift
//  Settings Xcode 7
//
//  Created by PJ Vea on 7/8/15.
//  Copyright © 2015 Vea Software. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func photoAction(sender: AnyObject){
        if PHPhotoLibrary.authorizationStatus() == .Denied {
            let alertController = UIAlertController(title: "Settings", message: "Looks like we don't have permission to access your photos library. Please enable it in Settings to continue.", preferredStyle: .Alert)
            
            let settingsAction = UIAlertAction(title: "Settings", style: .Default) { (alertAction) in
                if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.sharedApplication().openURL(appSettings)
                }
            }
            
            alertController.addAction(settingsAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            let imagePicker = UIImagePickerController()
            imagePicker.modalPresentationStyle = .CurrentContext
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
}

