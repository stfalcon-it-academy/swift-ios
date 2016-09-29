//
//  ViewController.swift
//  Demo12-UIScrollView
//
//  Created by Prashant on 28/09/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // outlet - scroll view
    @IBOutlet var myScrollView: UIScrollView!
    
    // image view
    var myImageView: UIImageView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove top padding from scroll view
        // view controller will put top padding within scroll view automatically.
        // by setting this property to false will remove that top padding.
        automaticallyAdjustsScrollViewInsets = false
        
        // set scroll view delegate (used for zoom)
        myScrollView.delegate = self
                
        // create image
        myImageView = UIImageView(image: UIImage(named: "bg"))
    }

    // must written within view did appear, so it will have proper width and height available.
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        // set scroll view content size same as image size
        myScrollView.contentSize = myImageView.bounds.size
        
        // auto resize sub view
        myScrollView.autoresizesSubviews = true
        
        // set content at (top,let) within scroll view
        myScrollView.contentOffset = CGPointZero
        
        // set scroll view bg color
        myScrollView.backgroundColor = UIColor.darkGrayColor()
        
         // add imageview within scroll view
        myScrollView.addSubview(myImageView)
    }
    
    // reset scale when layout changed
    override func viewWillLayoutSubviews() {
        // set scroll view min, max and current zoom scale
        let currentZoomScale = myScrollView.bounds.height / myImageView.bounds.size.height
        myScrollView.minimumZoomScale =  currentZoomScale / 2
        myScrollView.maximumZoomScale = 1.0
        myScrollView.zoomScale = currentZoomScale
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return myImageView
    }
}

