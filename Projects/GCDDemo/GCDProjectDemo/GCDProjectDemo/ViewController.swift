//
//  ViewController.swift
//  GCDProjectDemo
//
//  Created by msm72 on 6/29/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            // To do something work
            self.calcCustom()
            
            dispatch_async(dispatch_get_main_queue()) {
                // Return to main thread & show result for user in UI
                print("1. Function finished.")
            }

            dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                // Return to main thread & show result for user in UI
                print("2. Next code.")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Custom Functions
    func calcCustom() {
        for i in 1...10 {
            print(i)
        }
        
        print("Finished.")
    }
}

