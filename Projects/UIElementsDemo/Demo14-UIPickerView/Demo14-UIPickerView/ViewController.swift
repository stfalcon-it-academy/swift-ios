//
//  ViewController.swift
//  Demo14-UIPickerView
//
//  Created by Prashant on 30/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // color and size array
    var colorList: [String]!
    var sizeList: [String]!
    
    // outlet - color and size label
    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    
    // outlet - picker view
    @IBOutlet var pickerView: UIPickerView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up data
        setupData()
        
        // set picker view delegate
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Custom Functions
    // function - create data
    private func setupData() {
        // create color list
        colorList = ["(( Select ))", "Black", "Blue", "Brown", "Green", "Orange", "Pink" , "Purple", "Red", "Yellow"]
        
        // create size list
        sizeList = ["(( Select ))","S", "M", "L", "XL" ]
    }
}
    
    
// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    // how many component (i.e. column) to be displayed within picker view
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // How many rows are there is each component
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return colorList.count
        }
        
        if component == 1  {
            return sizeList.count
        }
        
        return 0
    }
}


// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    // title/content for row in given component
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return colorList[row]
        }
        
        if component == 1 {
            return sizeList[row]
        }
        
        return "Invalid Row"
    }
    
    // called when row selected from any component within a picker view
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            // if first row then set --
            if row == 0 {
                colorLabel.text = "--"
            } else {
                colorLabel.text = colorList[row]
            }
        }
        
        if component == 1 {
            // if first row then set --
            if row == 0 {
                sizeLabel.text = "--"
            } else {
                sizeLabel.text = sizeList[row]
            }
        }
    }
}

