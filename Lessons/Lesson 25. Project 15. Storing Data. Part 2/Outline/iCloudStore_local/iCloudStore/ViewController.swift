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

    override func viewDidLoad() {
        super.viewDidLoad()

        let filemgr = NSFileManager.defaultManager()
        
        let dirPaths = filemgr.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)

        documentURL = dirPaths[0].URLByAppendingPathComponent("savefile.txt")


        document = MyDocument(fileURL: documentURL!)
        document!.userText = ""

        if filemgr.fileExistsAtPath((documentURL?.path)!) {

            document?.openWithCompletionHandler({(success: Bool) -> Void in
                if success {
                    print("File open OK")
                    self.textView.text = self.document?.userText
                } else {
                    print("Failed to open file")
                }
            })
        } else {
            document?.saveToURL(documentURL!, forSaveOperation: 
            .ForCreating,
                     completionHandler: {(success: Bool) -> Void in
                if success {
                    print("File created OK")
                } else {
                    print("Failed to create file ")
                }
            })
        }

    }

    @IBAction func saveDocument(sender: AnyObject) {
        
        document!.userText = textView.text

        document?.saveToURL(documentURL!, 
           forSaveOperation: .ForOverwriting, 
               completionHandler: {(success: Bool) -> Void in
            if success {
                print("File overwrite OK")
            } else {
                print("File overwrite failed")
            }
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

