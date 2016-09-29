//
//  ViewController.swift
//  AlertViewController_Demo
//
//  Created by Nimble Chapps on 26/02/16.
//  Copyright © 2016 Nimble Chapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func click_Alert(sender: AnyObject) {
        let alertController = UIAlertController(title: "Simple", message: "Simple alertView demo with Cancel and Ok.", preferredStyle: .Alert)
        
        // Background color.
        let backView = alertController.view.subviews.last?.subviews.last
        backView?.layer.cornerRadius = 10.0
        backView?.backgroundColor = UIColor.yellowColor()
        
        // Change Title With Color and Font:
        let myString  = "Alert Title"
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 18.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location:0,length:myString.characters.count))
        alertController.setValue(myMutableString, forKey: "attributedTitle")

        // Change Message With Color and Font
        let message  = "This is testing message."
        var messageMutableString = NSMutableAttributedString()
        messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 18.0)!])
        messageMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.greenColor(), range: NSRange(location:0,length:message.characters.count))
        alertController.setValue(messageMutableString, forKey: "attributedMessage")

        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        // Change Ok button text color
        okAction.setValue(UIColor.purpleColor(), forKey: "titleTextColor")
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    @IBAction func click_Destructive(sender: AnyObject) {
        let alertController = UIAlertController(title: "Destructive", message: "Simple alertView demo with Destructive and Ok.", preferredStyle: .Alert)
        
        let DestructiveAction = UIAlertAction(title: "Destructive", style: .Destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
        }
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        
        alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func click_PlainTextAlertVeiw(sender: AnyObject) {
        let alertController = UIAlertController(title: "PlainTextStyle", message: "PlainTextStyle AlertView.", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField) -> Void in
            textField.placeholder = "Login"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (result : UIAlertAction) -> Void in
           print(alertController.textFields?.first?.text)
        }
       
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func click_SecureAlertView(sender: AnyObject) {
        let alertController = UIAlertController(title: "SecureStyle", message: "SecureStyle AlertView.", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField) -> Void in
            textField.secureTextEntry = true
            textField.placeholder = "Password"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (result : UIAlertAction) -> Void in
            print(alertController.textFields?.first?.text)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func click_LoginAlertView(sender: AnyObject) {
        let alertController = UIAlertController(title: "LoginStyle", message: "LoginStyle AlertView.", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField) -> Void in
            textField.placeholder = "Login"
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange(_:)), forControlEvents: .EditingChanged)
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField) -> Void in
            textField.secureTextEntry = true
            textField.placeholder = "Password"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (result : UIAlertAction) -> Void in
            print(alertController.textFields?.first?.text)
        }
        
        okAction.enabled = false
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: - Custom Functions
    func alertTextFieldDidChange(sender: UITextField) {
        let alertV = self.presentedViewController as? UIAlertController
        let login = (alertV!.textFields?.first)! as UITextField
        let okAction = alertV!.actions.last! as UIAlertAction
        okAction.enabled = login.text?.characters.count > 2
    }
}
