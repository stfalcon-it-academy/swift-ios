//
//  ViewController.swift
//  Demo19-UIWebView
//
//  Created by Prashant on 04/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    let urlString : String = "http://www.prashantmangukiya.com"
    
    @IBOutlet var myWebView: UIWebView!
    @IBOutlet var mySpinner: UIActivityIndicatorView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set webview delegate
        myWebView.delegate = self
        
        // fit content within screen size.
        myWebView.scalesPageToFit = true
        
        // start spinner
        mySpinner.startAnimating()
        
        // load url content within webview
        if let urlToBrowse = NSURL(string: self.urlString) {
            let urlRequest = NSURLRequest(URL: urlToBrowse)
            myWebView.loadRequest(urlRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    // MARK: - Actions
    @IBAction func refreshButtonAction(sender: UIBarButtonItem) {
        mySpinner.startAnimating()
        myWebView.reload()
    }
}


// MARK: - WKNavigationDelegate
extension ViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(webView: UIWebView) {
        mySpinner.stopAnimating()
    }
}

