//
//  ViewController.swift
//  WebView
//
//  Created by Malek T. on 7/23/15.
//  Copyright (c) 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var webView: UIWebView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidden = true
        
        // Delegate
        searchBar.delegate = self
        webView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let url = NSURL(string: "http://" + searchBar.text!)!
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
    }
}


// MARK: - UIWebViewDelegate
extension ViewController: UIWebViewDelegate {
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
        activityIndicator.hidden = true
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        let alert:UIAlertController = UIAlertController(title: "Error", message: "\(error)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        activityIndicator.hidden = true
    }
}

