//
//  ViewController.swift
//  iCloudStore
//
//  Created by Neil Smyth on 9/1/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var document: MyDocument?
    var documentURL: NSURL?
    var ubiquityURL: NSURL?
    var metaDataQuery: NSMetadataQuery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filemgr = NSFileManager.defaultManager()
        
        ubiquityURL = filemgr.URLForUbiquityContainerIdentifier(nil)
        
        guard ubiquityURL != nil else {
            print("Unable to access iCloud Account")
            print("Open the Settings app and enter your Apple ID into iCloud settings")
            return
        }
        
        ubiquityURL = ubiquityURL?.URLByAppendingPathComponent("Documents/savefile.txt")
        
        metaDataQuery = NSMetadataQuery()
        
        metaDataQuery?.predicate =
            NSPredicate(format: "%K like 'savefile.txt'",
                        NSMetadataItemFSNameKey)
        metaDataQuery?.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(ViewController.metadataQueryDidFinishGathering(_:)),
                                                         name: NSMetadataQueryDidFinishGatheringNotification,
                                                         object: metaDataQuery!)
        
        metaDataQuery!.startQuery()
    }
    
    func metadataQueryDidFinishGathering(notification: NSNotification) -> Void
    {
        let query: NSMetadataQuery = notification.object as! NSMetadataQuery
        
        query.disableUpdates()
        
        NSNotificationCenter.defaultCenter().removeObserver(self,
                                                            name: NSMetadataQueryDidFinishGatheringNotification,
                                                            object: query)
        
        query.stopQuery()
        
        let results = query.results
        
        if query.resultCount == 1 {
            let resultURL =
                results[0].valueForAttribute(NSMetadataItemURLKey) as! NSURL
            
            document = MyDocument(fileURL: resultURL)
            
            document?.openWithCompletionHandler({(success: Bool) -> Void in
                if success {
                    print("iCloud file open OK")
                    self.textView.text = self.document?.userText
                    self.ubiquityURL = resultURL
                } else {
                    print("iCloud file open failed")
                }
            })
        } else {
            document = MyDocument(fileURL: ubiquityURL!)
            
            document?.saveToURL(ubiquityURL!,
                                forSaveOperation: .ForCreating,
                                completionHandler: {(success: Bool) -> Void in
                                    if success {
                                        print("iCloud create OK")
                                    } else {
                                        print("iCloud create failed")
                                    }
            })
        }
    }
    
    
    @IBAction func saveDocument(sender: AnyObject) {
        document!.userText = textView.text
        
        document?.saveToURL(ubiquityURL!,
                            forSaveOperation: .ForOverwriting, 
                            completionHandler: {(success: Bool) -> Void in
                                if success {
                                    print("Save overwrite OK")
                                } else {
                                    print("Save overwrite failed")
                                }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

