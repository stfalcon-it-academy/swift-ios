//
//  ViewController.swift
//  Demo28-UITapGesture
//
//  Created by Prashant on 11/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // Initiate tap geture recognizer object
    let tapGesture = UITapGestureRecognizer()
    
    // outlet - tap count label
    @IBOutlet var tapCountLabel: UILabel!
    
    // set tap count default value
    var tapCount: Int = 0
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // set tap gesture recognizer delegte
        tapGesture.delegate = self
        
        // set tap gesture target 
        tapGesture.addTarget(self, action: #selector(increaseCount))
    
        // add tap gesture recognizer into view
        self.view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Custom Functions
    // function - increase count when screen tapped.
    func increaseCount(){
        tapCount += 1
        tapCountLabel.text = "\(tapCount)"
    }
}


// MARK: - UIGestureRecognizerDelegate
extension ViewController: UIGestureRecognizerDelegate {
    
}