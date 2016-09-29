//
//  ViewController.swift
//  HomeWork_14_1
//
//  Created by msm72 on 6/14/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var navigationTitle: UIBarButtonItem!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.google.com")!))
        
        // Delegate
        webView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func backAction(sender: AnyObject) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardAction(sender: AnyObject) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refreshAction(sender: AnyObject) {
        webView.reload()
    }
    
    @IBAction func stopAction(sender: AnyObject) {
        webView.stopLoading()
    }
}


// MARK: - UIWebViewDelegate
extension ViewController: UIWebViewDelegate {
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        navigationTitle.title = webView.stringByEvaluatingJavaScriptFromString("document.title")
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
}

