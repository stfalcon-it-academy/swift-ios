//
//  ViewController.swift
//  NestedScrollViews
//
//  Created by Joyce Echessa on 6/8/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var background: UIScrollView!
    @IBOutlet weak var foreground: UIScrollView!

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate
        foreground.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let foregroundHeight = foreground.contentSize.height - CGRectGetHeight(foreground.bounds)
        let percentageScroll = foreground.contentOffset.y / foregroundHeight
        let backgroundHeight = background.contentSize.height - CGRectGetHeight(background.bounds)
        
        background.contentOffset = CGPoint(x: 0, y: backgroundHeight * percentageScroll)
    }
}

