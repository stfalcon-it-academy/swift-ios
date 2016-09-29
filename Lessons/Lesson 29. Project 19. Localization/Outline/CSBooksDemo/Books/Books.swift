//
//  Books.swift
//  CSBooksDemo
//
//  Created by msm72 on 8/1/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

public class Book: NSObject, NSCoding {
    // MARK: - Properties
    public let title: String!
    public let author: String!
    
    
    // MARK: - Initialization
    public init(title: String, author: String) {
        self.title = title
        self.author = author
     
        super.init()
    }
    
    required public init(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObjectForKey("title") as? String ?? ""
        self.author = aDecoder.decodeObjectForKey("author") as? String ?? ""
    }
    
    
    // MARK: - NSCoding
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeObject(self.author, forKey: "author")
    }
}