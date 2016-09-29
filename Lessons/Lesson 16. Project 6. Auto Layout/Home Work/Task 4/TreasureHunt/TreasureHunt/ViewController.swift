//
//  ViewController.swift
//  TreasureHunt
//
//  Created by Abhishek Mishra on 14/04/2015.
//  Copyright (c) 2015 asm technology ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var largeImage: UIImageView!
    @IBOutlet weak var animatedImage: UIImageView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // install tap gestue recognizer.
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapRecognizer)
        
        // setup animatedImage
        let frameArray:[UIImage] = [
            UIImage(named: "animframe1")!,
            UIImage(named: "animframe2")!,
            UIImage(named: "animframe3")!,
            UIImage(named: "animframe4")!,
            UIImage(named: "animframe5")!,
            UIImage(named: "animframe6")!
        ]
        
        animatedImage.animationImages = frameArray
        animatedImage.animationDuration = 0.5
        animatedImage.animationRepeatCount = 1
        animatedImage.userInteractionEnabled = false
        animatedImage.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    func handleTap(sender: UITapGestureRecognizer) {
        let startLocation: CGPoint = sender.locationInView(self.largeImage)
        let scaleFactor = self.largeImage.frame.size.height / 430.0;
        
        if ((startLocation.y >= 211 * scaleFactor) && (startLocation.y <= (211 + 104) * scaleFactor)) {
            animatedImage.hidden = false
            animatedImage.startAnimating()
        }
    }
}

