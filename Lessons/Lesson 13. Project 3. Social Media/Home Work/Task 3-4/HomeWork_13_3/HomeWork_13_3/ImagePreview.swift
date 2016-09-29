//
//  ImagePreview.swift
//  HomeWork_13_3
//
//  Created by msm72 on 6/12/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ImagePreview: UIActivity {
    // MARK: - Class Functions
    // Move custom activity to top category panel
//    override static func activityCategory() -> UIActivityCategory {
//        return .Share
//    }
    
    override func activityType() -> String? {
        return "CustomAction.ImagePreview"
    }
    
    override func activityTitle() -> String? {
        return "Image Preview"
    }
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        print(#function)
        
        return true
    }
    
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        print(#function)
    }
    
    override func activityViewController() -> UIViewController? {
        print(#function)

        return nil
    }
    
    override func performActivity() {
        // TODO: handle action:
        print(#function)
        
        self.activityDidFinish(true)
    }
    
    override func activityImage() -> UIImage? {
        return UIImage(named: "preview-image-action")
    }
}
