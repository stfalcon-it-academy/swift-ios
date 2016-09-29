//
//  ViewController.swift
//  CircleViewDemo
//
//  Created by msm72 on 6/9/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties:
    @IBOutlet weak var customView: CustomView!
    @IBOutlet var longPressGestureRecognizer: UILongPressGestureRecognizer!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        longPressGestureRecognizer.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UIResponder
extension ViewController {
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesEnded")
        
        customView.changeAlphaByState(.Normal)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesBegan")
        
        customView.changeAlphaByState(.Pressed)
    }
}


// MARK: - UIGestureRecognizerDelegate
extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        print("gestureRecognizerShouldBegin")
        let nextStoryboard = UIStoryboard(name: "Next", bundle: nil)
        let nextVC = nextStoryboard.instantiateViewControllerWithIdentifier("NextVC")
        nextVC.navigationItem.title = "Next VC"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        navigationController?.pushViewController(nextVC, animated: true)
        customView.changeAlphaByState(.Normal)

        return true
    }
}