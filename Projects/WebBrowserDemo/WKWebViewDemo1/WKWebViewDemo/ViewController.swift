//
//  ViewController.swift
//  WKWebViewDemo
//
//  Created by msm72 on 6/12/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    // MARK: - Properties
    var webView: WKWebView?
    
    // MARK: - Class Functions
    override func loadView() {
        super.loadView()
    
        self.webView = WKWebView()
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let requestURL = NSURLRequest(URL: NSURL(string: "https://www.bignerdranch.com")!)
        self.webView!.loadRequest(requestURL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

