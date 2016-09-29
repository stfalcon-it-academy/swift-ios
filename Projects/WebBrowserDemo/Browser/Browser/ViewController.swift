//
//  ViewController.swift
//  Browser
//
//  Created by Joyce Echessa on 1/6/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    // MARK: - Properties
    var webView: WKWebView
    let barViewHeight: CGFloat = 30.0
    
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var progressView: UIProgressView!

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    
    
    // MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        self.webView = WKWebView(frame: CGRectZero)
        super.init(coder: aDecoder)

        // Delegate
        self.webView.navigationDelegate = self
    }

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Sets the size of the barView
        barView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: barViewHeight)
        
        // Add webView below progressView on the main view
        view.insertSubview(webView, belowSubview: progressView)
        
        // Disable auto-generated constraints
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        // The webView will have the same height and width as its superview’s height and width
        let height = NSLayoutConstraint(item: webView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: -44)
        let width = NSLayoutConstraint(item: webView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
        view.addConstraints([height, width])
        
        // Add 2 Observer for change webView content state
        webView.addObserver(self, forKeyPath: "loading", options: .New, context: nil)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
        
        // KVO - add & load first web page
        let url = NSURL(string: "http://www.appcoda.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
        // Without history navigation buttons are disabled
        backButton.enabled = false
        forwardButton.enabled = false
        
        // Delegate
        urlField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    @IBAction func back(sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func forward(sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    @IBAction func reload(sender: UIBarButtonItem) {
        let request = NSURLRequest(URL: webView.URL!)
        
        webView.loadRequest(request)
    }
    
    
    // MARK: - KVO
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<()>) {
        if (keyPath == "loading") {
            backButton.enabled = webView.canGoBack
            forwardButton.enabled = webView.canGoForward
        }
        
        if (keyPath == "estimatedProgress") {
            progressView.hidden = webView.estimatedProgress == 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }

    
    // MARK: - UIContentContainer (Rotation)
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        barView.frame = CGRect(x: 0, y: 0, width: size.width, height: barViewHeight)
    }
}


// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        urlField.resignFirstResponder()
        
        if let url = urlField.text {
            webView.loadRequest(NSURLRequest(URL: NSURL(string: url.hasPrefix("http") ? url : "http://" + url)!))
        }
        
        return false
    }
}


// MARK: - WKNavigationDelegate
extension ViewController: WKNavigationDelegate {
    // Gets called when there is an error
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // Reset the progress view value after each request
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
    }
}

