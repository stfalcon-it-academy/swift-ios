//
//  MyDocument.swift
//  iCloudStore
//
//  Created by Neil Smyth on 9/1/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import UIKit

class MyDocument: UIDocument {

    var userText: String? = "Some Sample Text"

    override func contentsForType(typeName: String) throws -> AnyObject {
        if let content = userText {
            
            let length = content.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
            return NSData(bytes:content, length: length)
            
        } else {
            return NSData()
        }
    }
    
    override func loadFromContents(contents: AnyObject, ofType typeName: String?) throws {

        if let userContent = contents as? NSData {
            userText = NSString(bytes: contents.bytes,
                length: userContent.length,
                encoding: NSUTF8StringEncoding) as? String
        }

    }

}
