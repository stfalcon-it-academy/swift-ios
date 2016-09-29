//
//  ViewController.swift
//  Demo5-UITextView
//
//  Created by Prashant on 27/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var myTextView: UITextView!
    
    
    // MARK: - Class Function
    override func viewDidLoad() {
        super.viewDidLoad()

        // Remove top offset within textView
        automaticallyAdjustsScrollViewInsets = false

        // Delegates
        myTextView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Close keyboard when touch the view
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // End editing mode for view
        view.endEditing(true)
    }

    
    // MARK: - Actions
    @IBAction func doneButtonAction(sender: UIButton) {
        myTextView.resignFirstResponder()
    }
}


// MARK: - UITextViewDelegate
extension ViewController: UITextViewDelegate {
    
}
