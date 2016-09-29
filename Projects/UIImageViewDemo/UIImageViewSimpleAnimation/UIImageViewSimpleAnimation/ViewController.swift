//
//  ViewController.swift
//  UIImageViewSimpleAnimation
//
//  Created by msm72 on 6/22/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var normalImageView: UIImageView!
    @IBOutlet weak var slowImageView: UIImageView!
    
    var images = [UIImage]()
    var firstImage = UIImage()
    
    let imageNames = [
        "win_1.png", "win_2.png", "win_3.png", "win_4.png",
        "win_5.png", "win_6.png", "win_7.png", "win_8.png",
        "win_9.png", "win_10.png", "win_11.png", "win_12.png",
        "win_13.png", "win_14.png", "win_15.png", "win_16.png"
    ]
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for name in imageNames {
            images.append(UIImage(named: name)!)
        }
        
        firstImage = images.first!
        normalImageView.image = firstImage
        slowImageView.image = firstImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Actions
    @IBAction func handlerButtonAnimationTap(sender: UIButton) {
        sender.tag = sender.tag == 0 ? 1 : 0
        
        if sender.tag == 1 {
            // Normal Animation
            normalImageView.animationImages = images
            normalImageView.animationDuration = 0.5
            normalImageView.startAnimating()
            
            // Slow motion animation
            slowImageView.animationImages = images
            slowImageView.animationDuration = 2.5;
            slowImageView.startAnimating()
        } else {
            normalImageView.stopAnimating()
            slowImageView.stopAnimating()
        }
    }

    @IBAction func handlerKeyFrameButtonTap(sender: UIButton) {
        let animation = CAKeyframeAnimation.init(keyPath: "contents")
       
        animation.calculationMode = kCAAnimationDiscrete
        animation.duration = 1 //Double(imageNames.count)// / 24.0; // 24 frames per second
        animation.values = images
        animation.repeatCount = 1
        animation.delegate = self
        
        normalImageView.layer.addAnimation(animation, forKey: "animation")
    }
    
    @IBAction func handlerFillModeButtonTap(sender: UIButton) {
        let animation = CAKeyframeAnimation.init(keyPath: "contents")
        
        animation.calculationMode = kCAAnimationDiscrete
        animation.duration = Double(imageNames.count)// / 24.0; // 24 frames per second
        animation.values = images
        animation.repeatCount = 1
        animation.delegate = self
        animation.fillMode = kCAFillModeForwards
        
        normalImageView.layer.addAnimation(animation, forKey: "animation")
    }
    
    // MARK: - Custom Functions
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if flag {
            normalImageView.image = firstImage
        }
    }
}


