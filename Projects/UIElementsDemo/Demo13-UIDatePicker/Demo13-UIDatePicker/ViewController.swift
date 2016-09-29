//
//  ViewController.swift
//  Demo13-UIDatePicker
//
//  Created by Prashant on 29/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // date formatter
    var dateFormatter: NSDateFormatter!
    
    // outlet - date label
    @IBOutlet var dateLabel: UILabel!
    
    // outlet - date picker
    @IBOutlet var datePicker: UIDatePicker!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set date formater for short date/time
        dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        // assign date picker date value to label
        dateLabel.text = dateFormatter.stringFromDate(datePicker.date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func datePickerAction(sender: UIDatePicker) {
        // assign date to label when date picker value changed
        dateLabel.text = dateFormatter.stringFromDate(sender.date)
    }
}

