//
//  ViewController.swift
//  UIAlertControllerDemo
//
//  Created by msm72 on 6/15/16.
//  Copyright © 2016 msm72. All rights reserved.
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
    @IBAction func handlerActionButtonTap(sender: UIButton) {
        // Create alert controller with alert style
        let alertController = UIAlertController(title: "Error", message: "No internet connection", preferredStyle: .Alert)
        
        // Add action button
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction) in
            print("You've pressed OK button");
        }
        
        alertController.addAction(OKAction)
        
        // Diplay alert controller
        self.presentViewController(alertController, animated: true, completion:nil)
    }
    
    @IBAction func handlerActionButtonsTap(sender: UIButton) {
        let alertController = UIAlertController(title: "Error", message: "No internet connection\nTry again?", preferredStyle: .Alert)
        
        let actionYes = UIAlertAction(title: "Yes", style: .Default) { (action:UIAlertAction) in
            print("You've pressed the Yes button");
        }
        
        let actionNo = UIAlertAction(title: "No", style: .Default) { (action:UIAlertAction) in
            print("You've pressed No button");
        }
        
        alertController.addAction(actionYes)
        alertController.addAction(actionNo)
        
        self.presentViewController(alertController, animated: true, completion:nil)
    }
    
    @IBAction func handlerActionInputTextButtonTap(sender: UIButton) {
        let alertController = UIAlertController(title: "Login", message: "Please enter your credentials.", preferredStyle: .Alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action:UIAlertAction) in
            // This is called when the user presses the cancel button.
            print("You've pressed the cancel button");
        }
        
        let actionLogin = UIAlertAction(title: "Login", style: .Default) { (action:UIAlertAction) in
            // This is called when the user presses the login button.
            let textUser = alertController.textFields![0] as UITextField;
            let textPW = alertController.textFields![1] as UITextField
            
            print("The user entered:%@ & %@",textUser.text!,textPW.text!);
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            // Configure the attributes of the first text box.
            textField.placeholder = "E-mail"
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            // Configure the attributes of the second text box.
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        
        // Add the buttons
        alertController.addAction(actionCancel)
        alertController.addAction(actionLogin)
        
        // Present the alert controller
        self.presentViewController(alertController, animated: true, completion:nil)
    }
    
    @IBAction func handlerActionSheetButtonTap(sender: UIButton) {
        // Create the alert controller
        let actionSheetController: UIAlertController = UIAlertController(title: "Choose action", message: "Would you like to learn more?", preferredStyle: .ActionSheet)
        
        // Create and add the "Cancel" action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            // Just dismiss the action sheet
            print("You've pressed Cancel button");
        }
        
        // Create and add "Yes" action
        let yesAction: UIAlertAction = UIAlertAction(title: "Yes", style: .Default) { action -> Void in
            // The user just pressed the Yes button.
            print("You've pressed Yes button");
        }
        
        actionSheetController.addAction(yesAction)
        actionSheetController.addAction(cancelAction)
        
        // Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
}

