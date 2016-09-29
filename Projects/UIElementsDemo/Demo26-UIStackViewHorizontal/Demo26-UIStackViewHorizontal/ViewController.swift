//
//  ViewController.swift
//  Demo26-UIStackViewHorizontal
//
//  Created by Prashant on 18/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // variable maintain how many images added to stack view
    var imageCount = 0
    
    // array stores image names
    var imageList: [String] = ["bg-1", "bg-2", "bg-3","bg-4","bg-5"]
    
    // outlet - stack view
    @IBOutlet var stackView: UIStackView!
    
    // outlet & action - add button
    @IBOutlet var addButton: UIBarButtonItem!
    
    
    // MARK: - Actions
    @IBAction func addButtonClicked(sender: UIBarButtonItem) {
        // add image to stack view
        addImageToStackView()
    }
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add image to stack view
        addImageToStackView()
        
        // add image to stack view
        addImageToStackView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Custom Functions
    // function - It will add new image to stack view and disable add
    // button if five images added.
    private func addImageToStackView() {
        // find image name based on image index
        let imageName: String = imageList[imageCount]
        
        // create new image object
        let newImage = UIImage(named: imageName)!
        
        // create new image view
        let newImageView = UIImageView(image: newImage)
        
        // set image view content mode
        newImageView.contentMode = .ScaleAspectFill
        
        // clip subview for image view
        newImageView.clipsToBounds = true
        
        // add image view into stack view
        stackView.addArrangedSubview(newImageView)
        
        // increase image index
        imageCount += 1
        
        // image image index go neyod 4 the disable add button
        if imageCount >= 5 {
            addButton.enabled = false
        }
    }
}

