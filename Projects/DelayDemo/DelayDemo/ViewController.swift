//
//  ViewController.swift
//  DelayDemo
//
//  Created by msm72 on 6/20/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var networkActivityIndicator: UIActivityIndicatorView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize activity indicator
        let transform = CGAffineTransformMakeScale(1.5, 1.5)
        networkActivityIndicator.transform = transform
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func handlerRunButtonTap(sender: AnyObject) {
        networkActivityIndicator.startAnimating()
        
        /*
        // NSTimer
        NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: #selector(stopAnimating), userInfo: nil, repeats: false)
        */
        
        
        // Delayed code that will run on background thread
        networkActivityIndicator.delay(bySeconds: 2.9, dispatchLevel: .Background) {
            self.networkActivityIndicator.stopAnimating()
        }
        
    }
    
    
    // MARK: - Custom Functions
    func stopAnimating() {
        networkActivityIndicator.stopAnimating()
    }
}


// MARK: -
extension UIActivityIndicatorView {
    enum DispatchLevel {
        case Main, UserInteractive, UserInitiated, Utility, Background
        
        var dispatchQueue: OS_dispatch_queue {
            switch self {
            case .Main:             return dispatch_get_main_queue()
            case .UserInteractive:  return dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)
            case .UserInitiated:    return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
            case .Utility:          return dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
            case .Background:       return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
            }
        }
    }
    
    func delay(bySeconds seconds: Double, dispatchLevel: DispatchLevel = .Main, closure: () -> Void) {
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
        dispatch_after(dispatchTime, dispatchLevel.dispatchQueue, closure)
    }
}