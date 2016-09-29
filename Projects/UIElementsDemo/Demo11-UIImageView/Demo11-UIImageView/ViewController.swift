//
//  ViewController.swift
//  Demo11-UIImageView
//
//  Created by Prashant on 28/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    // MARK: - Properties
    // content mode list
    var contentModeList: [String]!
    
    // current content mode index
    var contentModeIndex: Int!
    
    // image list
    var imageList: [String]!

    // current image index
    var imageIndex: Int!
    
    // outlet - image view
    @IBOutlet var myImageView: UIImageView!
    
    // outlet - content mode label
    @IBOutlet var contentModeLabel: UILabel!
    
    // outlet - Prev button
    @IBOutlet var previousButton: UIBarButtonItem!
    
    // outlet - Next button
    @IBOutlet var nextButton: UIBarButtonItem!
    
    // outlet & action - swap image button
    @IBOutlet var swapButton: UIBarButtonItem!

    // outlet & action - reset button
    @IBOutlet var resetButton: UIBarButtonItem!

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create sample data
        loadData()
        
        // set default content mode index
        contentModeIndex  = 0
        
        // set default image index
        imageIndex = 0
        
        // set image
        setImage()
        
        // set image content mode
        setImageContentMode()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func previousButtonAction(sender: UIBarButtonItem) {
        // set prev content mode in the list
        if contentModeIndex >= 0 {
            contentModeIndex! -= 1
        }
        
        // set image content mode
        setImageContentMode()
    }
    
    @IBAction func nextButtonAction(sender: UIBarButtonItem) {
        // set next content mode in the list
        if contentModeIndex < contentModeList.count {
            contentModeIndex! += 1
        }
        
        // set image content mode
        setImageContentMode()
    }
    
    @IBAction func swapButtonAction(sender: UIBarButtonItem) {
        // swap image index
        if imageIndex == 0 {
            imageIndex = 1
        } else {
            imageIndex = 0
        }
        
        // set image
        setImage()
    }
    
    @IBAction func resetButtonAction(sender: UIBarButtonItem) {
        // set default content mode index
        contentModeIndex  = 0

        // set default image index
        imageIndex = 0
    
        // set image
        setImage()
        
        // set image content mode
        setImageContentMode()
    }
    
    
    // MARK: - Custom Function
    // create/load sample data
    private func loadData() {
        // initialise content mode list
        self.contentModeList = [
            "ScaleToFill",
            "ScaleAspectFit",
            "ScaleAspectFill",
            "Redraw",
            "Center",
            "Top",
            "Bottom",
            "Left",
            "Right",
            "TopLeft",
            "TopRight",
            "BottomLeft",
            "BottomRight"
        ]
        
        // initialise image list
        imageList = ["bg-1", "bg-2"]
    }
    
    // set image to image view
    private func setImage() {
        myImageView.image = UIImage(named: imageList[imageIndex])
    }
    
    // set imageView content mode
    private func setImageContentMode() {
        // set content mode
        myImageView.contentMode = UIViewContentMode.init(rawValue: contentModeIndex)!

        // set label for current content mode
        contentModeLabel.text = contentModeList[contentModeIndex]
        
        // enable/disable prev next button
        setButton()
    }
    
    // enable/disable prev next button
    private func setButton() {
        if contentModeIndex == 0 {
            previousButton.enabled = false
            nextButton.enabled = true
        } else if (contentModeIndex == contentModeList.count - 1 ) {
            previousButton.enabled = true
            nextButton.enabled = false
        } else {
            previousButton.enabled = true
            nextButton.enabled = true
        }
    }
}

