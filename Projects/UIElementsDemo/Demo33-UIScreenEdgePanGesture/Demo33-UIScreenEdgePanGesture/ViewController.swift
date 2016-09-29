//
//  ViewController.swift
//  Demo33-UIScreenEdgePanGesture
//
//  Created by Prashant on 15/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // outlet - status label
    @IBOutlet var statusLabel: UILabel!
    
    // create left edge and right edge gesture
    let leftEdgePanGesture = UIScreenEdgePanGestureRecognizer()
    let rightEdgePanGesture = UIScreenEdgePanGestureRecognizer()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add target for gesture
        leftEdgePanGesture.addTarget(self, action: #selector(handleLeftEdge(_:)))
        rightEdgePanGesture.addTarget(self, action: #selector(handleRightEdge(_:)))

        // set detection edge
        leftEdgePanGesture.edges = UIRectEdge.Left
        rightEdgePanGesture.edges = UIRectEdge.Right
        
        // add gesture into view
        self.view.addGestureRecognizer(leftEdgePanGesture)
        self.view.addGestureRecognizer(rightEdgePanGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Custom Functions
    // perform operation when left edge gesture detected
    func handleLeftEdge( gesture: UIScreenEdgePanGestureRecognizer ) {
        statusLabel.text = "Left Edge"
        statusLabel.textColor = UIColor.blackColor()
    }

    // perform operation when right edge gesture detected    
    func handleRightEdge( gesture: UIScreenEdgePanGestureRecognizer ) {
        statusLabel.text = "Right Edge"
        statusLabel.textColor = UIColor.blueColor()
    }
}

