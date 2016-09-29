//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Hossam Ghareeb on 11/15/15.
//  Copyright © 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit
import Operations

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var imageViewCollection: [UIImageView]!    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    var queue = NSOperationQueue()

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func didClickOnStart(sender: AnyObject) {
        /*
        // Option 1
        //let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        // Option 2
        //let queue = dispatch_queue_create("com.appcoda.imagesQueue", DISPATCH_QUEUE_CONCURRENT)

        // Option 2
        let queue = dispatch_queue_create("com.appcoda.imagesQueue", DISPATCH_QUEUE_SERIAL)
        

        // Create Operation
        for (i, imageView) in imageViewCollection.enumerate() {
            dispatch_async(queue) { () -> Void in
                let image = Downloader.downloadImageWithURL(imageURLs[i])
               
                dispatch_async(dispatch_get_main_queue(), {
                    imageView.image = image
                })
            }
        }
         */
        
        queue = NSOperationQueue()
        var operationPrevious = [NSBlockOperation]()

        // Create Operation
        for (i, imageView) in imageViewCollection.enumerate() {
            let operation = NSBlockOperation(block: {
                let image = Downloader.downloadImageWithURL(imageURLs[i])
                
                NSOperationQueue.mainQueue().addOperationWithBlock({
                    imageView.image = image
                })
            })
            
            if i != imageViewCollection.startIndex && i != imageViewCollection.endIndex {
                operation.addDependency(operationPrevious[i - 1])
            }
            
            operation.completionBlock = {
                print("Operation \(i) completed, cancelled: \(operation.cancelled)")
            }
            
            queue.addOperation(operation)
            operationPrevious.append(operation)
        }
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        sliderValueLabel.text = "\(sender.value * 100.0)"
    }

    @IBAction func didClickOnCancel(sender: AnyObject) {
        queue.cancelAllOperations()
    }
}

