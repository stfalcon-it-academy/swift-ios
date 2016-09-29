//
//  ViewController.swift
//  Demo30-UIRotationGesture
//
//  Created by Prashant on 13/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    // MARK: - Properties
    // outlet - sample view
    @IBOutlet var sampleView: UIView!
    
    // create rotation gesture recognizer
    let rotateGesture = UIRotationGestureRecognizer()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // create rotation gesture recognizer
        rotateGesture.delegate = self
        
        // add rotate gesture target
        rotateGesture.addTarget(self, action: #selector(rotateView(_:)))
    
        // add rotate gesture within view
        self.view.addGestureRecognizer(rotateGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Custom Functions
    func rotateView(gesture: UIRotationGestureRecognizer) {
        sampleView.transform = CGAffineTransformRotate(sampleView.transform, gesture.rotation)
        gesture.rotation = 0
    }
}


// MARK: - UIGestureRecognizerDelegate
extension ViewController: UIGestureRecognizerDelegate {
    
}