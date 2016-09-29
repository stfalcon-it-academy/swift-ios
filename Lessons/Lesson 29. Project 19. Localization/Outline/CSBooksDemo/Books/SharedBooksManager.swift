//
//  SharedBooksManager.swift
//  CSBooksDemo
//
//  Created by msm72 on 8/1/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

public class SharedBooksManager: NSObject {
    // MARK: - Class Functions
    public class func urlForSharedBooksArray() -> String? {
        let directoryURL = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier("group.com.stfalcon.CSBooksDemo")
        let fileURL = directoryURL?.URLByAppendingPathComponent("SharedCSBooks.plist")
        
        return fileURL?.path
    }
    
}