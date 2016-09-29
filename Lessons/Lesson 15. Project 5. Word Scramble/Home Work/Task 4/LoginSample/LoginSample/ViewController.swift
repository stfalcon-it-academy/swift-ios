//
//  ViewController.swift
//  LoginSample
//
//  Created by Abhishek Mishra on 31/03/2015.
//  Copyright (c) 2015 asm technology ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundTap(_:)))
        tapRecognizer.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tapRecognizer)
        
        // Delegates
//        usernameField.delegate = self
//        passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Actions
    @IBAction func onDismissKeyboard(sender: UITextField) {
        if sender == userNameField {
            passwordField.becomeFirstResponder()
        } else if sender == passwordField {
            sender.resignFirstResponder()
        }
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        view.endEditing(true)
        
        let userName = userNameField.text
        let password = passwordField.text
        
        guard userName != nil && passwordField != nil else {
            return
        }
        
        guard userName!.characters.count > 0 && password!.characters.count > 0 else {
            return
        }
        
        let alert = UIAlertController(title: "Info", message: "Login succesfull", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Custom Functions
    func handleBackgroundTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}


// MARK: - UItextFieldDelegate
//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        if textField == usernameField {
//            passwordField.becomeFirstResponder()
//        } else if textField == passwordField {
//            textField.resignFirstResponder()
//        }
//    
//        return true
//    }
//}
