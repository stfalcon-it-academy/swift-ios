//
//  MainViewController.swift
//  StopWatch
//
//  Created by msm72 on 6/17/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter = 0.0
    var timer = NSTimer()
    var isPlaying = false
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        timeLabel.text = String(counter)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

    // MARK: - Actions
    @IBAction func resetButtonDidTouch(sender: AnyObject) {
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
        playButton.enabled = true
        pauseButton.enabled = true
    }
    
    @IBAction func playButtonDidTouch(sender: AnyObject) {
        if (isPlaying) {
            return
        }
        
        playButton.enabled = false
        pauseButton.enabled = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(sender: AnyObject) {
        playButton.enabled = true
        pauseButton.enabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    
    // MARK: - Custom Functions
    func updateTimer() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
}
