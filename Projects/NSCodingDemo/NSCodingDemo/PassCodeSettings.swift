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
    

    // MARK: - Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("passCodeSettings")

    
    // MARK: - PropertiesKeys
    struct PropertyKey {
        static let isPasscodeEnabledKey = "isPasscodeEnabled"
        static let attemptCountKey = "attemptCount"
        static let checkIntervalKey = "checkInterval"
        static let nextCheckDateKey = "nextCheckDate"
    }

    
    // MARK: - Initialization
    init(passcode: Bool, count: Int, interval: NSTimeInterval, date: NSDate) {
        self.isPasscodeEnabled = passcode
        self.attemptCount = count
        self.checkInterval = interval
        self.nextCheckDate = date
    }


    required convenience init?(coder aDecoder: NSCoder) {
        let _isPasscodeEnabled = aDecoder.decodeBoolForKey(PropertyKey.isPasscodeEnabledKey)
        let _attemptCount = aDecoder.decodeIntegerForKey(PropertyKey.attemptCountKey)
        let _checkInterval = aDecoder.decodeObjectForKey(PropertyKey.checkIntervalKey) as! NSTimeInterval
        let _nextCheckDate = aDecoder.decodeObjectForKey(PropertyKey.nextCheckDateKey) as! NSDate
        
        // Must call designated initializer.
        self.init(passcode: _isPasscodeEnabled, count: _attemptCount, interval: _checkInterval, date: _nextCheckDate)
    }
    
    
    // MARK: - Class Functions
    func printProperties(step: Int) {
        print("\(step). isPasscodeEnabled = \(isPasscodeEnabled), attemptCount = \(attemptCount), checkInterval = \(checkInterval), nextCheckDate = \(nextCheckDate)")
    }
}


// MARK: - NSCoding
extension PassCodeSettings: NSCoding {
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeBool(isPasscodeEnabled, forKey: PropertyKey.isPasscodeEnabledKey)
        aCoder.encodeInt(Int32(attemptCount), forKey: PropertyKey.attemptCountKey)
        aCoder.encodeObject(checkInterval, forKey: PropertyKey.checkIntervalKey)
        aCoder.encodeObject(nextCheckDate, forKey: PropertyKey.nextCheckDateKey)
    }
}
