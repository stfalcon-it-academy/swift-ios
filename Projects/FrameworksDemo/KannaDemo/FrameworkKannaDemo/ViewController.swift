//
//  ViewController.swift
//  FrameworkKannaDemo
//
//  Created by msm72 on 6/19/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit
import Kanna

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var webView: UIWebView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        displayWebPageFromURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Custom Functions
    func displayWebPageFromURL() {
        let myURLAdress = "https://apple.com"
        let myURL = NSURL(string: myURLAdress)
        
        let URLTask = NSURLSession.sharedSession().dataTaskWithURL(myURL!) { myData, response, error in
            guard error == nil else { return }
            
            let myHTMLString = String(data: myData!, encoding: NSUTF8StringEncoding)
            self.webView.loadHTMLString(myHTMLString!, baseURL: NSURL(string: "https://www.google.com.ua"))
            
            print(myHTMLString!)
            
            // Use Kanna
            if let doc = Kanna.HTML(html: myHTMLString!, encoding: NSUTF8StringEncoding) {
                // Search for nodes by CSS
                for link in doc.css("a, link") {
                    print(link.text!)
                    print(link["href"]!)
                }
                
                // Search for nodes by XPath
//                for link in doc.xpath("//a | //link") {
//                    print(link.text!)
//                    print(link["href"]!)
//                }
            }
        }
     
        URLTask.resume()
    }
}
