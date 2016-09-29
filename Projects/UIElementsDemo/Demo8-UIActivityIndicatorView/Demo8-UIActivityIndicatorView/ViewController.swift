//
//  ViewController.swift
//  Demo8-UIActivityIndicatorView
//
//  Created by Prashant on 27/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var spinner1: UIActivityIndicatorView!
    @IBOutlet var spinner2: UIActivityIndicatorView!
    @IBOutlet var spinner3: UIActivityIndicatorView!
    @IBOutlet var spinner4: UIActivityIndicatorView!
    
    @IBOutlet var spinButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var showHideButton: UIButton!

    
    // MARK: - Actions
    @IBAction func spinButtonAction(sender: UIButton) {
        spinner1.startAnimating()
        spinner2.startAnimating()
        spinner3.startAnimating()
        spinner4.startAnimating()
        
        spinButton.enabled = false
        stopButton.enabled = true
        showHideButton.enabled = false
    }
    
    @IBAction func stopButtonAction(sender: UIButton) {
        spinner1.stopAnimating()
        spinner2.stopAnimating()
        spinner3.stopAnimating()
        spinner4.stopAnimating()

        spinButton.enabled = true
        stopButton.enabled = false
        showHideButton.enabled = true
    }
    
    @IBAction func showHideButtonAction(sender: UIButton) {
        if showHideButton.selected {
            showHideButton.selected = false
            
            spinner1.hidden = false
            spinner2.hidden = false
            spinner3.hidden = false
            spinner4.hidden = false

            spinButton.enabled = true
            stopButton.enabled = false
        } else {
            showHideButton.selected = true
            
            spinner1.hidden = true
            spinner2.hidden = true
            spinner3.hidden = true
            spinner4.hidden = true
            
            spinButton.enabled = false
            stopButton.enabled = false
        }
    }
    
    
    
    
    // MARK: - Class Function
    override func viewDidLoad() {
        super.viewDidLoad()

        spinButton.enabled = true
        stopButton.enabled = false
        showHideButton.enabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

