//
//  PassCodeSettings.swift
//  NSCodingDemo
//
//  Created by msm72 on 6/6/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class PassCodeSettings: NSObject {
    // MARK: - Properties
    let isPasscodeEnabled: Bool
    let attemptCount: Int
    let checkInterval: NSTimeInterval
    let nextCheckDate: NSDate
    
    // Home work
    var properties: [AnyObject]
    
    
    // MARK: - Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("passCodeSettings")

    
    // MARK: - PropertiesKeys
    struct PropertyKey {
        static let propertiesKey = "properties"
    }

    
    // MARK: - Initialization
    init(properties: [AnyObject]) {
        self.properties = properties

        guard properties.count > 0 else {
            self.isPasscodeEnabled = false
            self.attemptCount = 0
            self.checkInterval = 0.0
            self.nextCheckDate = NSDate.init(timeIntervalSinceNow: 0)

            return
        }
        
        self.isPasscodeEnabled = properties[0] as! Bool
        self.attemptCount = properties[1] as! Int
        self.checkInterval = properties[2] as! NSTimeInterval
        self.nextCheckDate = properties[3] as! NSDate
    }

    required convenience init?(coder aDecoder: NSCoder) {
        let _properties = aDecoder.decodeObjectForKey(PropertyKey.propertiesKey) as! [AnyObject]
        
        // Must call designated initializer.
        self.init(properties: _properties)
    }
    
    
    // MARK: - Class Functions
    func printProperties(step: Int) {
        if properties.count > 0 {
            print("\(step). properties: isPasscodeEnabled = \(properties[0]), attemptCount = \(properties[1]), checkInterval = \(properties[2]), nextCheckDate = \(properties[3])")
        }
        
        print("\(step). isPasscodeEnabled = \(isPasscodeEnabled), attemptCount = \(attemptCount), checkInterval = \(checkInterval), nextCheckDate = \(nextCheckDate)")
    }
}


// MARK: - NSCoding
extension PassCodeSettings: NSCoding {
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(properties, forKey: PropertyKey.propertiesKey)
    }
}
