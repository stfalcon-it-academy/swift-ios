//
//  ViewController.swift
//  HomeWork_13_3
//
//  Created by msm72 on 6/11/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var actionBarButton: UIBarButtonItem!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = nil
        textView.textContainerInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5.0, 0.0, 0.0)
        textField.delegate = self
        textView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Actions
    @IBAction func handlerActionButtonTap(sender: UIBarButtonItem) {
        if !textField.text!.isEmpty && !textView.text!.isEmpty {
            // Create action sheet
            let actionSheet = UIAlertController(title: "", message: "Share your Note", preferredStyle: .ActionSheet)
            
            // Create Twitter action
            let tweetAction = createAlertAction(serviceType: SLServiceTypeTwitter)
            
            // Create Facebook action
            let facebookAction = createAlertAction(serviceType: SLServiceTypeFacebook)

            // Create Cancel action
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            // Add all actions to menu
            actionSheet.addAction(facebookAction)
            actionSheet.addAction(tweetAction)
            actionSheet.addAction(cancelAction)
            
            // Check action sheet popover mode
            if let popoverController = actionSheet.popoverPresentationController {
                popoverController.barButtonItem = self.actionBarButton
            }

            // Display action sheet
            presentViewController(actionSheet, animated: true, completion: nil)
        } else {
            self.showAlertMessage("Please, enter text or URL.")
        }
    }
    
    @IBAction func handlerImageViewTapGestureRecognizer(sender: UITapGestureRecognizer) {
        // Get image file URL
        /*
         // Option 1 with UIDocumentInteractionController
        let fileURL = NSBundle.mainBundle().URLForResource("euro-2016-logo", withExtension: "png")!
        
        // Initialising UIDocumentInteractionController with fileURL
        let documentIC = UIDocumentInteractionController(URL: fileURL)
        documentIC.delegate = self
        
        documentIC.presentPreviewAnimated(true)
        */
        
        // Option 2 with custom UIActivity
        let objectsToShare = [self.imageView.image!]
        let applicationActivities = [ImagePreview()]
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: applicationActivities)
        
        // ActivityVC Handler
        activityVC.completionWithItemsHandler = {(activityType, completed: Bool, returnedItems: [AnyObject]?, error: NSError?) in
            
            // Run activity
            if (completed) {
                let imagePreviewVC = self.storyboard?.instantiateViewControllerWithIdentifier("ImagePreviewVC") as! ImagePreviewViewController
                imagePreviewVC.image = self.imageView.image!
                
                self.presentViewController(imagePreviewVC, animated: true, completion: nil)
            } else {
                print("canceled custom preview image activity")
            }
        }

        if let activityPopoverVC = activityVC.popoverPresentationController {
            activityPopoverVC.sourceView = self.imageView
            activityPopoverVC.sourceRect = self.imageView!.bounds
        }

        self.presentViewController(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) { }

    
    // MARK: - Custom Functions
    func createAlertAction(serviceType actionName: String) -> UIAlertAction {
        // Configure a new action for sharing the note
        let actionTitle = actionName == SLServiceTypeTwitter ? "Share on Twitter": "Share on Facebook"
        
        let currentAction = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.Default) { (action) -> Void in
            // Check if sharing to social is possible
            if SLComposeViewController.isAvailableForServiceType(actionName) {
                // Initialize the default view controller for sharing the post
                let currentComposeVC = SLComposeViewController(forServiceType: actionName)
                
                // Set the note text as the default post message
                let isPostedText = currentComposeVC.setInitialText(self.textField.text! + "\n")
                let isPostedURL = currentComposeVC.addURL(NSURL(string: self.textView.text!))
                let isPostedImage = currentComposeVC.addImage(self.imageView.image!)
                
                print(isPostedText, isPostedURL, isPostedImage)
                
                // Completion handler
                currentComposeVC.completionHandler = { (result: SLComposeViewControllerResult) in
                    print("\(actionTitle) completion handler \(result) run");
                    
                    if result == .Cancelled {
                        print("The user select Cancel");
                    } else if result == .Done {
                        print("The user select Post in \(actionTitle)");
                    }
                }
                
                // Display the compose view controller.
                self.presentViewController(currentComposeVC, animated: true, completion: nil)
            } else {
                self.showAlertMessage("You are not logged in to your \(actionName == SLServiceTypeTwitter ? "Twitter" : "Facebook") account.")
            }
        }
        
        return currentAction
    }
    
    func showAlertMessage(message: String!) {
        let alertController = UIAlertController(title: "Info", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}


// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textView.becomeFirstResponder()
        
        return true
    }
}


// MARK: - UITextViewDelegate
extension ViewController: UITextViewDelegate {
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
           
            return false
        }
        
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        if (textView.text == "\n" && textView.text.characters.count == 1) {
            textView.text = nil
        }
        
        else if textView.text.hasSuffix("\n") {
            textView.text.removeAtIndex(textView.text.endIndex.advancedBy(-1))
        }
    }
}


// MARK: - UIDocumentInteractionControllerDelegate 
extension ViewController: UIDocumentInteractionControllerDelegate {
    func documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
    func presentPreviewAnimated(animated: Bool) -> Bool {
        return true
    }
    
    func documentInteractionControllerRectForPreview(controller: UIDocumentInteractionController) -> CGRect {
        return self.view.frame
    }
}
