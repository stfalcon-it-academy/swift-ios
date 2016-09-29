//
//  ViewController.swift
//  Demo4-UITextField
//
//  Created by Prashant on 26/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var fullName: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var debugLabel: UILabel!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegates
        fullName.delegate = self
        email.delegate = self
        password.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Actions
    @IBAction func submitButtonAction(sender: UIButton) {
        var debugMessage = ""
        debugMessage += "Name: " + fullName.text! + "\n"
        debugMessage += "E-mail: " + email.text! + "\n"
        debugMessage += "Password: " + password.text! + "\n"
        debugLabel.text = debugMessage
    }
}


// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    // move cursor to next text field when clicked return button,
    // close the keboard when last text field done.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // resign responder from given text field
        textField.resignFirstResponder()
        
        // set responder to next text field
        if textField == fullName {
            email.becomeFirstResponder()
        } else if textField == email {
            password.becomeFirstResponder()
        }
        
        return false
    }
    
    // close keyboard upon touching the view anywhere.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // end editing mode for the view
        view.endEditing(true)
    }
}

