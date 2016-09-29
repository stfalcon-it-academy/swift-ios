//
//  ViewController.swift
//  CloudKVSDemo2
//
//  Created by msm72 on 7/16/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    let iStore: NSUbiquitousKeyValueStore = NSUbiquitousKeyValueStore.defaultStore()
    
    @IBOutlet weak var actionButton: UIButton!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(storeDidChange), name: NSUbiquitousKeyValueStoreDidChangeExternallyNotification, object: iStore)
        
        //iStore.synchronize()
        
        storeDidChange()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func handlerChangeBackgroundClicked(sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        // Black Action Sheet Button
        let actionBlack = UIAlertAction(title: "Black", style: .Default) { (action: UIAlertAction) in
            self.backgroundColorChangedWithColor(UIColor.blackColor(), title: "Black")
        }
        
        // Gray Action Sheet Button
        let actionGray = UIAlertAction(title: "Gray", style: .Default) { (action: UIAlertAction) in
            self.backgroundColorChangedWithColor(UIColor.grayColor(), title: "Gray")
        }

        // Gray Action Sheet Button
        let actionPurple = UIAlertAction(title: "Purple", style: .Default) { (action: UIAlertAction) in
            self.backgroundColorChangedWithColor(UIColor.purpleColor(), title: "Purple")
        }

        alertController.addAction(actionBlack)
        alertController.addAction(actionGray)
        alertController.addAction(actionPurple)
        alertController.addAction(UIAlertAction(title: "Close", style: .Cancel, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    
    // MARK: - Custom Functions
    func storeDidChange() {
        let data = iStore.objectForKey("Background") as? NSData
        
        guard data != nil else {
            print(#function + ": data = nil")
            
            return
        }
        
        let color = NSKeyedUnarchiver.unarchiveObjectWithData(data!) as! UIColor
        self.view.backgroundColor = color
        
        let title = iStore.objectForKey("Title") as! String
        actionButton.setTitle(title, forState: .Normal)
        actionButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    func backgroundColorChangedWithColor(color: UIColor, title: String) {
        self.view.backgroundColor = color
        actionButton.setTitle(title, forState: .Normal)
        actionButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        // Update data on the iCloud
        iStore.setObject(NSKeyedArchiver.archivedDataWithRootObject(color), forKey: "Background")
        iStore.setString(title, forKey: "Title")
        iStore.synchronize()
    }
}

