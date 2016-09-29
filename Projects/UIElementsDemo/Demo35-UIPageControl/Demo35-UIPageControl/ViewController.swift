//
//  ViewController.swift
//  Demo35-UIPageControl
//
//  Created by Prashant on 23/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // create swipe gesture
    let swipeGestureLeft = UISwipeGestureRecognizer()
    let swipeGestureRight = UISwipeGestureRecognizer()
    
    // outlet - page control
    @IBOutlet var myPageControl: UIPageControl!
    
    // current page number label
    @IBOutlet var currentPageLabel: UILabel!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set gesture direction
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirection.Left
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.Right
        
        // add gesture target
        swipeGestureLeft.addTarget(self, action: #selector(handleSwipeLeft(_:)))
        swipeGestureRight.addTarget(self, action: #selector(handleSwipeRight(_:)))
    
        // add gesture in to view
        view.addGestureRecognizer(swipeGestureLeft)
        view.addGestureRecognizer(swipeGestureRight)
        
        // set current page number label.
        setCurrentPageLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Custom Functions
    // increase page number on swift left
    func handleSwipeLeft(gesture: UISwipeGestureRecognizer){
        if self.myPageControl.currentPage < 9 {
            myPageControl.currentPage += 1
            setCurrentPageLabel()
        }
    }
    
    // reduce page number on swift right
    func handleSwipeRight(gesture: UISwipeGestureRecognizer){
        if myPageControl.currentPage != 0 {
            myPageControl.currentPage -= 1
            setCurrentPageLabel()
        }
    }
    
    // set current page number label
    private func setCurrentPageLabel(){
        currentPageLabel.text = "\(myPageControl.currentPage + 1)"
    }
}
