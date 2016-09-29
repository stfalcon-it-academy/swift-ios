//
//  SecondViewController.swift
//  UIVisualEffectViewDemo
//
//  Created by msm72 on 6/23/16.
//  Copyright © 2016 msm72. All rights reserved.
//
// https://www.hackingwithswift.com/example-code/uikit/how-to-add-blur-and-vibrancy-using-uivisualeffectview


import UIKit

class SecondViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Second VC"
        imageView.image = UIImage(named: "bridge-to-ocean")
        imageView.addBlurEffect(self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension UIImageView {
    func addBlurEffect(view: UIView) {
        self.contentMode = .ScaleToFill

        let blurEffect = UIBlurEffect(style: .Dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = self.bounds
        view.addSubview(blurredEffectView)
        
        let segmentedControl = UISegmentedControl(items: ["First Item", "Second Item"])
        segmentedControl.sizeToFit()
        segmentedControl.center = view.center
        
        let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffectView.frame = self.bounds
        
        vibrancyEffectView.contentView.addSubview(segmentedControl)
        blurredEffectView.contentView.addSubview(vibrancyEffectView)
    }
}