//
//  ViewController.swift
//  Demo29-UIPinchGesture
//
//  Created by Prashant on 12/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // blue color square view
    @IBOutlet var squareView: UIView!
    
    // pinch gesture object
    var pinchGesture = UIPinchGestureRecognizer()
    
        
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set pinch gesture delegate
        pinchGesture.delegate = self
        
        // set pinch gesture target
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchRecognized(_:)))
        
        // add pinch gesture recognizer to view
        self.view.addGestureRecognizer(pinchGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Custom Functions
    func pinchRecognized(pinch: UIPinchGestureRecognizer) {
        // change view scale based on pinch
        squareView.transform = CGAffineTransformScale(squareView.transform, pinch.scale, pinch.scale)
        pinch.scale = 1.0
    }
}


// MARK: - UIGestureRecognizerDelegate
extension ViewController: UIGestureRecognizerDelegate {
    
}
