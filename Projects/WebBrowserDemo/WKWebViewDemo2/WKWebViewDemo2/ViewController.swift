//
//  ViewController.swift
//  WKWebViewDemo2
//
//  Created by msm72 on 6/12/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    // MARK: - Properties
    var webView : WKWebView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // loading URL :
        let myBlog = "https://iosdevcenters.blogspot.com/"
        let url = NSURL(string: myBlog)
        let request = NSURLRequest(URL: url!)
        
        // init and load request in webview.
        webView = WKWebView(frame: self.view.frame)
        webView.navigationDelegate = self
        webView.loadRequest(request)
        self.view.addSubview(webView)
        self.view.sendSubviewToBack(webView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//MARK:- WKNavigationDelegate
extension ViewController: WKNavigationDelegate {
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print(#function, error.localizedDescription)
    }
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print(#function + ": start to load")
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print(#function + ": finish to load")
    }
}