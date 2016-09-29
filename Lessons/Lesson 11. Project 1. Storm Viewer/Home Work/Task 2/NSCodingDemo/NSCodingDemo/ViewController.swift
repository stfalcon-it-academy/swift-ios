//
//  ViewController.swift
//  NSCodingDemo
//
//  Created by msm72 on 6/6/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var count: UILabel!
    
    var passCodeSettings = PassCodeSettings(properties: [])
    

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create object
        // Load any saved passCodeSettings, otherwise load sample data.
        if let passCodeSettingsLoad = loadPassCodeSettings() {
            passCodeSettings = passCodeSettingsLoad
            passCodeSettings.printProperties(2)
            
            // Set stored values
            segmentedControl.selectedSegmentIndex = passCodeSettings.isPasscodeEnabled ? 0 : 1
            stepper.value = Double(passCodeSettings.attemptCount)
            count.text = String(Int(stepper.value))
            textField.text = String(passCodeSettings.checkInterval)
            datePicker.date = passCodeSettings.nextCheckDate
        } else {
            count.text = String(Int(stepper.value))
            passCodeSettings.printProperties(1)
        }
        
        // Delegate
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Actions
    @IBAction func handlerSegmentedControlValueChanged(sender: UISegmentedControl) {
    }
    
    @IBAction func handlerStepperValueChange(sender: UIStepper) {
        count.text = String(Int(stepper.value))
    }

    @IBAction func handlerDatePickerValueChange(sender: UIDatePicker) {
    }
    
    @IBAction func handlerSaveButtonTap(sender: UIButton) {
        passCodeSettings.properties += [segmentedControl.selectedSegmentIndex == 0 ? true : false, Int(stepper.value), NSTimeInterval(textField.text!)!, datePicker.date]
        
        savePassCodeSettings()
    }
    
    
    // MARK: - Custom Functions
    func loadPassCodeSettings() -> PassCodeSettings? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(PassCodeSettings.ArchiveURL.path!) as? PassCodeSettings
    }
    
    func savePassCodeSettings() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(passCodeSettings, toFile: PassCodeSettings.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save object...")
        } else {
            passCodeSettings.printProperties(3)
        }
    }
}


// MARK: - UItextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if string == "," {
            return false
        }
        
        return true
    }
}

