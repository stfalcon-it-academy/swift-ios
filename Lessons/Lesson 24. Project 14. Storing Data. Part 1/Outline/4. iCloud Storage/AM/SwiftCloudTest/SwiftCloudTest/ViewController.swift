//
//  ViewController.swift
//  SwiftCloudTest
//
//  Created by Abhishek Mishra on 11/08/2015.
//  Copyright © 2015 asm technology ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var cloudServicesAreAvailable: Bool?
    var cloudDocument: SwiftCloudTestDocument?
    var searchQuery: NSMetadataQuery?
    
    @IBOutlet weak var serviceStatus: UILabel!
    @IBOutlet weak var documentContentView: UITextView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        documentContentView.text = ""
        
        // Add observers
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(refreshDocumentPreview(_:)), name: "refreshDocumentPreview" , object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        // check if cloud services are available.
        let containerURL = NSFileManager.defaultManager().URLForUbiquityContainerIdentifier(nil)
        
        if containerURL != nil  {
            self.cloudServicesAreAvailable = true
            serviceStatus.text = "Cloud Service Status: Available"
            
            // load existing document, or create a new document
            loadDocument()
        } else {
            self.cloudServicesAreAvailable = false
            serviceStatus.text = "Cloud Service Status: Not Available"
            
            let alert = UIAlertController(title: "Error", message: "iCloud has not been setup on this device!", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    deinit {
        if cloudDocument != nil {
            cloudDocument?.closeWithCompletionHandler(nil)
        }
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func onSaveDocument(sender: AnyObject) {
        if cloudDocument == nil {
            return
        }
        
        documentContentView.resignFirstResponder()
        cloudDocument!.documentContents = documentContentView.text
        
        cloudDocument!.saveToURL(cloudDocument!.fileURL, forSaveOperation: .ForCreating) { (success) -> Void in
            if (success) {
                self.cloudDocument!.openWithCompletionHandler(nil)
            }
        }
    }
    
    
    // MARK: - Custom Functions
    func createDocument(){
        if self.cloudDocument == nil {
            let containerURL = NSFileManager.defaultManager().URLForUbiquityContainerIdentifier(nil)
            let documentDirectoryURL = containerURL!.URLByAppendingPathComponent("Documents")
            let documentURL = documentDirectoryURL.URLByAppendingPathComponent("cloudDocument.txt")
            
            cloudDocument = SwiftCloudTestDocument(fileURL: documentURL)
        }
        
        cloudDocument!.documentContents = documentContentView.text
        
        cloudDocument!.saveToURL(cloudDocument!.fileURL, forSaveOperation: UIDocumentSaveOperation.ForCreating) { (success) -> Void in
            if (success) {
                self.cloudDocument!.openWithCompletionHandler(nil)
            }
        }
    }
    
    func loadDocument(){
        // search for cloudDocument.txt
        searchQuery = NSMetadataQuery()
        searchQuery!.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope];
        
        let documentFileName = "cloudDocument.txt"
        let predicate = NSPredicate(format: "%K == %@", argumentArray: [NSMetadataItemFSNameKey, documentFileName])
        searchQuery!.predicate = predicate
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(queryDidFinish(_:)), name: NSMetadataQueryDidFinishGatheringNotification , object: searchQuery)
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        searchQuery!.startQuery()
    }
    
    func queryDidFinish(notifcation: NSNotification) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        // stop the query to prevent it from running constantly
        searchQuery!.disableUpdates()
        searchQuery!.stopQuery()
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NSMetadataQueryDidFinishGatheringNotification, object: nil)
        
        // this application expects this query to return a single
        // result. If no dcouments were found, then create a new
        // document and inform the user.
        if searchQuery!.resultCount == 0 {
            let alert = UIAlertController(title: "", message: "Unable to find iCloud document, creating new document!", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            createDocument()
            
            return
        }
        
        // instantiate a SwiftCloudTestDocument instance and open the cloud document
        if cloudDocument == nil {
            let item:NSMetadataItem? = searchQuery!.results[0] as? NSMetadataItem
            
            if let unwrappedItem = item {
                let url = unwrappedItem.valueForAttribute(NSMetadataItemURLKey) as! NSURL
                cloudDocument = SwiftCloudTestDocument(fileURL: url)
            }
        }
        
        cloudDocument!.openWithCompletionHandler { (success) -> Void in
            if (success) {
                let alert = UIAlertController(title: "", message: "iCloud document loaded!", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "", message: "Could not load iCloud document!", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    func refreshDocumentPreview(notifcation: NSNotification) {
        documentContentView.text = cloudDocument!.documentContents;
    }
}

