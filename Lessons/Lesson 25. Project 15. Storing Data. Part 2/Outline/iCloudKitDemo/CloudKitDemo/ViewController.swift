//
//  ViewController.swift
//  CloudKitDemo
//
//  Created by Neil Smyth on 9/2/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import UIKit
import CloudKit
import MobileCoreServices

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var commentsField: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    let container = CKContainer.defaultContainer()
    var publicDatabase: CKDatabase?
    var currentRecord: CKRecord?
    var photoURL: NSURL?
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuring a CloudKit Subscription
        publicDatabase = container.publicCloudDatabase
        
        let predicate = NSPredicate(format: "TRUEPREDICATE")
        let subscription = CKSubscription(recordType: "Houses", predicate: predicate, options: .FiresOnRecordCreation)
        let notificationInfo = CKNotificationInfo()
        
        notificationInfo.alertBody = "A new House was added"
        notificationInfo.shouldBadge = true
        subscription.notificationInfo = notificationInfo
        
        publicDatabase?.saveSubscription(subscription, completionHandler: ({returnRecord, error in
            if let err = error {
                print("subscription failed %@", err.localizedDescription)
            } else {
                dispatch_async(dispatch_get_main_queue()) {
                    self.notifyUser("Success", message: "Subscription set up successfully")
                }
            }
        }))
    }
    
    // Hiding the Keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        addressField.endEditing(true)
        commentsField.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    // Saving a Record to the Cloud Database
    @IBAction func saveRecord(sender: AnyObject) {
        if (photoURL == nil) {
            notifyUser("No Photo", message: "Use the Photo option to choose a photo for the record")
            
            return
        }
        
        let asset = CKAsset(fileURL: photoURL!)
        let myRecord = CKRecord(recordType: "Houses")
        myRecord.setObject(addressField.text, forKey: "address")
        myRecord.setObject(commentsField.text, forKey: "comment")
        myRecord.setObject(asset, forKey: "photo")
        
        publicDatabase!.saveRecord(myRecord, completionHandler: ({returnRecord, error in
            if let err = error {
                self.notifyUser("Save Error", message: err.localizedDescription)
            } else {
                dispatch_async(dispatch_get_main_queue()) {
                    self.notifyUser("Success", message: "Record saved successfully")
                }
                
                self.currentRecord = myRecord
            }
        }))
    }
    
    @IBAction func performQuery(sender: AnyObject) {
        let predicate = NSPredicate(format: "address = %@", addressField.text!)
        let query = CKQuery(recordType: "Houses", predicate: predicate)
        
        publicDatabase?.performQuery(query, inZoneWithID: nil, completionHandler: ( {results, error in
            if (error != nil) {
                dispatch_async(dispatch_get_main_queue()) {
                    self.notifyUser("Cloud Access Error", message: error!.localizedDescription)
                }
            } else {
                if results!.count > 0 {
                    
                    let record = results![0]
                    self.currentRecord = record
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        self.commentsField.text = record.objectForKey("comment") as! String
                        let photo = record.objectForKey("photo") as! CKAsset
                        let image = UIImage(contentsOfFile: photo.fileURL.path!)
                        
                        self.imageView.image = image
                        self.photoURL = self.saveImageToFile(image!)
                    }
                } else {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.notifyUser("No Match Found", message: "No record matching the address was found")
                    }
                }
            }
        }))
    }
    
    @IBAction func selectPhoto(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        
        // Delegates
        imagePicker.delegate = self
        
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        
        self.presentViewController(imagePicker, animated: true, completion:nil)
    }
    
    @IBAction func updateRecord(sender: AnyObject) {
        if let record = currentRecord {
            let asset = CKAsset(fileURL: photoURL!)
            
            record.setObject(addressField.text, forKey: "address")
            record.setObject(commentsField.text, forKey: "comment")
            record.setObject(asset, forKey: "photo")
            
            publicDatabase!.saveRecord(record, completionHandler: ({returnRecord, error in
                if let err = error {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.notifyUser("Update Error", message: err.localizedDescription)
                    }
                } else {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.notifyUser("Success", message: "Record updated successfully")
                    }
                }
            }))
        } else {
            notifyUser("No Record Selected", message: "Use Query to select a record to update")
        }
    }
    
    @IBAction func deleteRecord(sender: AnyObject) {
        if let record = currentRecord {
            publicDatabase?.deleteRecordWithID(record.recordID, completionHandler: ({returnRecord, error in
                if let err = error {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.notifyUser("Delete Error", message: err.localizedDescription)
                        
                    }
                } else {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.notifyUser("Success", message: "Record deleted successfully")
                    }
                }
            }))
        } else {
            notifyUser("No Record Selected", message: "Use Query to select a record to delete")
        }
    }
    
    
    // MARK: - Custom Functions
    func fetchRecord(recordID: CKRecordID) -> Void {
        publicDatabase = container.publicCloudDatabase
        
        publicDatabase?.fetchRecordWithID(recordID, completionHandler: ({record, error in
            if let err = error {
                dispatch_async(dispatch_get_main_queue()) {
                    self.notifyUser("Fetch Error", message: err.localizedDescription)
                }
            } else {
                dispatch_async(dispatch_get_main_queue()) {
                    self.currentRecord = record
                    self.addressField.text = record!.objectForKey("address") as? String
                    self.commentsField.text = record!.objectForKey("comment") as? String
                    let photo = record!.objectForKey("photo") as! CKAsset
                    let image = UIImage(contentsOfFile: photo.fileURL.path!)
                    self.imageView.image = image
                    self.photoURL = self.saveImageToFile(image!)
                }
            }
        }))
    }
    
    func notifyUser(title: String, message: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveImageToFile(image: UIImage) -> NSURL {
        let filemgr = NSFileManager.defaultManager()
        let dirPaths = filemgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let filePath = dirPaths[0].URLByAppendingPathComponent("currentImage.png").path
        
        UIImageJPEGRepresentation(image, 0.5)!.writeToFile(filePath!, atomically: true)
        
        return NSURL.fileURLWithPath(filePath!)
    }
}


// MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.dismissViewControllerAnimated(true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        photoURL = saveImageToFile(image)
    }
    
    func imagePickerControllerDidCancel(picker:
        UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

