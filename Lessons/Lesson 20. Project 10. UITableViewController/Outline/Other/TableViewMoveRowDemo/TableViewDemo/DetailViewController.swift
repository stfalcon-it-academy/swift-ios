//
//  DetailViewController.swift
//  TableViewDemo
//
//  Created by Ravi Shankar on 03/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    var socialMedia: SocialMedia?
    var index: Int?
    
    @IBOutlet var textFeild: UITextField?
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneBarButton.enabled = false
        
        if let name = socialMedia?.name {
            textFeild?.text = name
        }
        
        // Delegates
        textFeild?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    // MARK: - Transition
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let name = textFeild?.text
        
        if socialMedia != nil {
            socialMedia!.name = name!
        } else {
            socialMedia = SocialMedia(name: name!, imageName: "unknown")
        }
    }
}


// MARK: - UITextFieldDelegate
extension DetailViewController: UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        doneBarButton.enabled = true
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textFeild?.resignFirstResponder()
        
        return true
    }
}