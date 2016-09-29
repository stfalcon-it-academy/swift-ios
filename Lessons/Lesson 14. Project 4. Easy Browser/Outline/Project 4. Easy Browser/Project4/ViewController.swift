//
//  ViewController.swift
//  Project4
//
//  Created by Hudzilla on 13/09/2015.
//  Copyright © 2015 Paul Hudson. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    // MARK: - Properties
	var webView: WKWebView!
	var progressView: UIProgressView!
	var websites = ["apple.com", "eff.org"]
    var scrollPagePoint = CGPointZero
    let defaults = NSUserDefaults.standardUserDefaults()
    var pageURL: String?
    var isReloadTap = false
    
    enum DataType: String {
        case X = "offsetX"
        case Y = "offsetY"
        case URL = "pageURL"
    }
    
    
    // MARK: - Class Functions
	override func loadView() {
		webView = WKWebView()
		webView.navigationDelegate = self
		view = webView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

        // Add to navbar action bar button
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .Plain, target: self, action: #selector(openTapped))

        // Load saved scroll page position
        loadContentOffsetPoint()

		progressView = UIProgressView(progressViewStyle: .Default)
		progressView.sizeToFit()
		let progressButton = UIBarButtonItem(customView: progressView)

		let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
		let refresh = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(reloadPage))

		toolbarItems = [progressButton, spacer, refresh]
		navigationController?.toolbarHidden = false

        let url = NSURL(string: pageURL!) ?? NSURL(string: "https://" + websites[0])!
		webView.loadRequest(NSURLRequest(URL: url))
		webView.allowsBackForwardNavigationGestures = true

		webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
        
        // Delegate
        webView.scrollView.delegate = self
	}

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

    
    // MARK: - Custom Functions
	func openTapped() {
		let alertController = UIAlertController(title: "Open page…", message: nil, preferredStyle: .ActionSheet)

		for website in websites {
			alertController.addAction(UIAlertAction(title: website, style: .Default, handler: openPage))
		}

		alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
		
        // Display menu in iPad
        if let popoverController = alertController.popoverPresentationController {
            popoverController.barButtonItem = navigationItem.rightBarButtonItem
        }

        presentViewController(alertController, animated: true, completion: {
            self.scrollPagePoint = CGPointZero
        })
	}

	func openPage(action: UIAlertAction!) {
		let url = NSURL(string: "https://" + action.title!)!
		
        webView.loadRequest(NSURLRequest(URL: url))
        pageURL = url.absoluteString
	}
    
    func reloadPage() {
        isReloadTap = !isReloadTap
        webView.reload()
    }
    
    func loadContentOffsetPoint() {
        let x = CGFloat(defaults.floatForKey(DataType.X.rawValue))
        let y = CGFloat(defaults.floatForKey(DataType.Y.rawValue))
        scrollPagePoint = CGPointMake(x, y)
        pageURL = defaults.objectForKey(DataType.URL.rawValue) as? String ?? websites[0]
        
        print("loadPoint = \(scrollPagePoint), pageURL = \(pageURL!)")
    }
    
    func saveContentOffsetPoint() {
        defaults.setFloat(Float(scrollPagePoint.x), forKey: DataType.X.rawValue)
        defaults.setFloat(Float(scrollPagePoint.y), forKey: DataType.Y.rawValue)
        defaults.setObject(pageURL!, forKey: DataType.URL.rawValue)
        
        defaults.synchronize()
        print("savePoint = \(scrollPagePoint)")
    }



    // MARK: - KVO
	override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        // Compare keyPath with some webView property name
		if keyPath == "estimatedProgress" {
			progressView.progress = Float(webView.estimatedProgress)
            print("progressView.progress = \(progressView.progress)")
        }
	}
}


// MARK: - WKNavigationDelegate
extension ViewController: WKNavigationDelegate {
	func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
		let url = navigationAction.request.URL
        pageURL = url?.absoluteString

		if let host = url!.host {
			for website in websites {
				if host.rangeOfString(website) != nil {
					decisionHandler(.Allow)
					
                    return
				}
			}
        }
        
        UIApplication.sharedApplication().openURL(navigationAction.request.URL!)
        decisionHandler(.Cancel)
	}
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        title = webView.title
        progressView.setProgress(0.0, animated: true)
        
        if !isReloadTap {
            UIView.animateWithDuration(0.5, delay: 1.5, options: .LayoutSubviews, animations: {
                webView.scrollView.setContentOffset(self.scrollPagePoint, animated: true)
                
                // Save scroll page position
                self.saveContentOffsetPoint()
                }, completion: nil)
        }
    }
}


// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        print(#function + ": contentOffset.y = \(scrollView.contentOffset.y)")
        
        scrollPagePoint = scrollView.contentOffset
        
        // Save scroll page position
        saveContentOffsetPoint()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(#function + ": contentOffset.y = \(scrollView.contentOffset.y)")
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print(#function + ": contentOffset.y = \(scrollView.contentOffset.y)")
        
        scrollPagePoint = scrollView.contentOffset
        
        // Save scroll page position
        saveContentOffsetPoint()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !scrollView.dragging {
            print(#function + ": contentOffset.y = \(scrollView.contentOffset.y)")
            
            scrollPagePoint = scrollView.contentOffset
            
            // Save scroll page position
            saveContentOffsetPoint()
        }
    }
}
