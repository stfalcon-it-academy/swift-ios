//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 5/23/15.
//  Copyright © 2015 Apple Inc. All rights reserved.
//  See LICENSE.txt for this sample’s licensing information.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!

    @IBOutlet weak var tttt: UITextField!
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        tttt.delegate = self
    }
    
    
    // MARK: - Actions
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
}


// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    // Called when 'return' key pressed. Return 'NO' to ignore.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
       
        return true
    }
    
    // Called after the text field resigns its first-responder status
    func textFieldDidEndEditing(textField: UITextField) {
        if textField === nameTextField {
            mealNameLabel.text = textField.text
        }
    }
}