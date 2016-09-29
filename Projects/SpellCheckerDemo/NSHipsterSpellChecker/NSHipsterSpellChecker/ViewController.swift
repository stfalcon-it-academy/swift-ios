//
//  ViewController.swift
//  UIText​CheckerDemo
//
//  Created by msm72 on 6/15/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var textField: UITextField!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegates
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }

    
    // MARK: - Custom Functions
    func spellChecking(word: String) {
        let textChecker = UITextChecker()
        let misspelledRange = textChecker.rangeOfMisspelledWordInString(word, range: NSRange(0..<word.utf16.count), startingAt: 0, wrap: false, language: "en_US")
        
        if misspelledRange.location != NSNotFound, let guesses = textChecker.guessesForWordRange(misspelledRange, inString: word, language: "en_US") as? [String] {
            print("First guess: \(guesses.first)")
        } else {
            print("Not found")
        }
    }
}


// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        spellChecking(textField.text! + string)
        
        return true
    }
}