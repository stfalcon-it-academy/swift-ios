//
//  ViewController.swift
//  UIDocumentInteractionControllerDemo
//
//  Created by msm72 on 6/9/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var documentController: UIDocumentInteractionController!
    @IBOutlet weak var actionButton: UIBarButtonItem!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Disable action button
        actionButton.enabled = false
        
        // Set priority for dispatch
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        // Take instantiation off the main thread
        dispatch_async(dispatch_get_global_queue(priority, 0)) { [unowned self] in
            // Retrieve URL to file in main bundle
            let fileURL = NSBundle.mainBundle().URLForResource("Example", withExtension: "pdf")!
            
            // Instantiate the interaction controller
            self.documentController = UIDocumentInteractionController(URL: fileURL)
            self.documentController.delegate = self

            dispatch_async(dispatch_get_main_queue()) { [unowned self] in
                // Re-enable action button
                self.actionButton.enabled = true
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    @IBAction func shareDocument(sender: AnyObject) {
        // present UIDocumentInteractionController
        documentController.name = "Quick read mode"
        UIBarButtonSystemItem.Action
        sender.tag == 0 ?   documentController.presentOptionsMenuFromBarButtonItem(sender as! UIBarButtonItem, animated: true) :
                            documentController.presentPreviewAnimated(true)
    }
}


// MARK: - UIDocumentInteractionControllerDelegate
extension ViewController: UIDocumentInteractionControllerDelegate {
    func documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
}
