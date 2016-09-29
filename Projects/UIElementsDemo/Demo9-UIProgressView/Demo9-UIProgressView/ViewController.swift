//
//  ViewController.swift
//  Demo9-UIProgressView
//
//  Created by Prashant on 28/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    // MARK: - Properties
    var myTimer: NSTimer?

    @IBOutlet var progressView1: UIProgressView!
    @IBOutlet var progressLabel: UILabel!
    
    @IBOutlet var playButton: UIBarButtonItem!
    @IBOutlet var resetButton: UIBarButtonItem!
    @IBOutlet var pauseButton: UIBarButtonItem!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create timer
        myTimer = NSTimer()
        
        // Set progress view default value and label
        progressView1.progress = 0.0
        let proressValue = Int(progressView1.progress * 100)

        // Set progress value count
        progressLabel.text = "\(proressValue)"
        
        // Enable play button
        playButton.enabled = true
        
        // Enable reset button
        resetButton.enabled = false
        
        // Disable pause button
        pauseButton.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    // MARK: - Actions
    @IBAction func playButtonAction(sender: UIBarButtonItem) {
        if progressView1.progress >= 1 {
            progressView1.progress = 0.0
        }
        
        // Schedule timer
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        
        // Enable/disable button
        playButton.enabled = false
        resetButton.enabled = false
        pauseButton.enabled = true
    }
    
    @IBAction func resetButtonAction(sender: UIBarButtonItem) {
        // Reset progress view
        progressView1.progress = 0.0
        
        // Reset progress value label
        progressLabel.text = "0"
        
        // Enable/disable button
        playButton.enabled = true
        resetButton.enabled = true
        pauseButton.enabled = false
    }
    
    
    @IBAction func pauseButtonAction(sender: UIBarButtonItem) {
        // Invalidate timer
        myTimer?.invalidate()
        
        // Enable/disable button
        playButton.enabled = true
        resetButton.enabled = true
        pauseButton.enabled = false
    }

    
    // MARK: - Custom Functions
    func updateProgress() {
        // Increase progress value
        progressView1.progress += 0.01

        // Set label for progress value
        progressLabel.text = "\(Int(progressView1.progress * 100))"

        // Invalidate timer if progress reach to 1
        if progressView1.progress >= 1 {
            // Invalidate timer
            myTimer?.invalidate()
            
            // Enable/disable button
            playButton.enabled = true
            resetButton.enabled = true
            pauseButton.enabled = false
        }
    }
}
