//
//  RateViewController.swift
//  Restaraunts
//
//  Created by Игорь on 06.12.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var stack: UIStackView!
    
    var rating: String?
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translation = CGAffineTransformMakeTranslation(0, 500)
        
        stack.transform = CGAffineTransformConcat(scale, translation)
        
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        
        backgroundImageView.addSubview(blurEffectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1.0, delay: 0, options: [], animations: {
            self.stack.transform = CGAffineTransformIdentity
            }, completion: nil)
    }

    
    // MARK: - Navigation
    @IBAction func rateSelect(sender: UIButton) {
        switch sender.tag {
        case 1: rating = "dislike"
        case 2: rating = "good"
        case 3: rating = "great"
        default: break
        }
        
        performSegueWithIdentifier("unwindToDetail", sender: sender)
    }
}

