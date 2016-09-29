//
//  SwiftCloudTestDocument.swift
//  SwiftCloudTest
//
//  Created by Abhishek Mishra on 11/08/2015.
//  Copyright © 2015 asm technology ltd. All rights reserved.
//

import UIKit

enum DocumentReadError: ErrorType {
    case InvalidInput
}

enum DocumentWriteError: ErrorType {
    case NoContentToSave
}

class SwiftCloudTestDocument: UIDocument {
    var documentContents: String?
    
    override init(fileURL url: NSURL) {
        super.init(fileURL: url)
    }
    
    override func loadFromContents(contents: AnyObject, ofType typeName: String?) throws {
        if let castedContents = contents as? NSData {
            documentContents = NSString(data: castedContents, encoding: NSUTF8StringEncoding) as? String
            NSNotificationCenter.defaultCenter().postNotificationName("refreshDocumentPreview", object: self)
        } else {
            documentContents = nil
            throw DocumentReadError.InvalidInput
        }
    }
    
    override func contentsForType(typeName: String) throws -> AnyObject {
        if documentContents == nil {
            throw DocumentWriteError.NoContentToSave
        }
        
        return documentContents!.dataUsingEncoding(NSUTF8StringEncoding)!
    }
}

