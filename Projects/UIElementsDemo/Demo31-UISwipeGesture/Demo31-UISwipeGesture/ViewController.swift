//
//  ViewController.swift
//  Demo31-UISwipeGesture
//
//  Created by Prashant on 14/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // outlet - sample view
    @IBOutlet var sampleView: UIView!
    
    // create swipe gesture
    let swipeGestureLeft = UISwipeGestureRecognizer()
    let swipeGestureRight = UISwipeGestureRecognizer()
    let swipeGestureUp = UISwipeGestureRecognizer()
    let swipeGestureDown = UISwipeGestureRecognizer()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set gesture delegate
        swipeGestureLeft.delegate = self
        swipeGestureRight.delegate = self
        swipeGestureUp.delegate = self
        swipeGestureDown.delegate = self
        
        // set gesture direction
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.Left
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.Right
        swipeGestureUp.direction = UISwipeGestureRecognizerDirection.Up
        swipeGestureDown.direction = UISwipeGestureRecognizerDirection.Down
        
        // set gesture target
        swipeGestureLeft.addTarget(self, action: #selector(handleSwipeLeft(_:)))
        swipeGestureRight.addTarget(self, action: #selector(handleSwipeRight(_:)))
        swipeGestureUp.addTarget(self, action: #selector(ViewController.handleSwipeUp(_:)))
        swipeGestureDown.addTarget(self, action: #selector(ViewController.handleSwipeDown(_:)))
        
        // add gesture into view
        self.view.addGestureRecognizer(swipeGestureLeft)
        self.view.addGestureRecognizer(swipeGestureRight)
        self.view.addGestureRecognizer(swipeGestureUp)
        self.view.addGestureRecognizer(swipeGestureDown)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Custom Functions
    // function - handle swift left
    func handleSwipeLeft(gesture: UISwipeGestureRecognizer) {
        let newPosition = CGRect(x: self.sampleView.frame.origin.x - 20.0 , y: self.sampleView.frame.origin.y, width: self.sampleView.frame.width, height: self.sampleView.frame.height)
        
        self.sampleView.frame = newPosition
    }
    
    // function - handle swift right
    func handleSwipeRight (gesture: UISwipeGestureRecognizer) {
        let newPosition = CGRect(x: self.sampleView.frame.origin.x + 20.0 , y: self.sampleView.frame.origin.y, width: self.sampleView.frame.width, height: self.sampleView.frame.height)
        
        self.sampleView.frame = newPosition
    }
    
    // function - handle swift Up
    func handleSwipeUp (gesture: UISwipeGestureRecognizer) {
        let newPosition = CGRect(x: self.sampleView.frame.origin.x, y: self.sampleView.frame.origin.y - 20.0, width: self.sampleView.frame.width, height: self.sampleView.frame.height)
        
        self.sampleView.frame = newPosition
    }
    
    // function - handle swift Down
    func handleSwipeDown (gesture: UISwipeGestureRecognizer) {
        let newPosition = CGRect(x: self.sampleView.frame.origin.x, y: self.sampleView.frame.origin.y + 20.0, width: self.sampleView.frame.width, height: self.sampleView.frame.height)
        
        self.sampleView.frame = newPosition
    }
}



// MARK: - UIGestureRecognizerDelegate
extension ViewController: UIGestureRecognizerDelegate { }
