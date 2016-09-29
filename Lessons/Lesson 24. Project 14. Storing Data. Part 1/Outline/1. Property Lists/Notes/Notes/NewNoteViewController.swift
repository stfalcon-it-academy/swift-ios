//
//  NewNoteViewController.swift
//  Notes
//
//  Created by Malek T. on 5/29/15.
//  Copyright (c) 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var textView: UITextView!
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func saveNote(sender: AnyObject) {
        // Save note to plist
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let pathForThePlistFile = appDelegate.plistPathInDocument
        
        // Extract the content of the file as NSData
        let data: NSData = NSFileManager.defaultManager().contentsAtPath(pathForThePlistFile)!
        
        // Convert the NSData to mutable array
        do {
            let notesArray = try NSPropertyListSerialization.propertyListWithData(data, options: .MutableContainersAndLeaves, format: nil) as! NSMutableArray
            notesArray.addObject(self.textView.text)
            
            // Save to plist
            notesArray.writeToFile(pathForThePlistFile, atomically: true)
        } catch {
            print("An error occurred while writing to plist")
        }
        
        // Dismiss the modal controller
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
