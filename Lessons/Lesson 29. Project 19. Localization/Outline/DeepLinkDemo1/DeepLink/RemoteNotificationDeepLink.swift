//
//  RemoteNotificationDeepLink.swift
//  DeepLink
//
//  Created by Brian Coleman on 2015-07-12.
//  Copyright (c) 2015 Brian Coleman. All rights reserved.
//

import UIKit

let RemoteNotificationDeepLinkAppSectionKey : String = "article"

class RemoteNotificationDeepLink: NSObject {
    // MARK: - Properties
    var article: String = ""
    
    
    // MARK: - Class Functions
    class func create(userInfo: [NSObject : AnyObject]) -> RemoteNotificationDeepLink? {
        let info = userInfo as NSDictionary
        let articleID = info.objectForKey(RemoteNotificationDeepLinkAppSectionKey) as! String
        var ret: RemoteNotificationDeepLink? = nil
        
        if !articleID.isEmpty {
            ret = RemoteNotificationDeepLinkArticle(articleStr: articleID)
        }
        
        return ret
    }
    
    private override init() {
        self.article = ""
        
        super.init()
    }
    
    private init(articleStr: String) {
        self.article = articleStr
        
        super.init()
    }
    
    final func trigger() {
        dispatch_async(dispatch_get_main_queue()) {
            //NSLog("Triggering Deep Link - %@", self)
            self.triggerImp()
                { (passedData) in
                    // do nothing
            }
        }
    }
    
    private func triggerImp(completion: ((AnyObject?)->(Void))) {
        completion(nil)
    }
}

class RemoteNotificationDeepLinkArticle : RemoteNotificationDeepLink {
    var articleID : String!
    
    override init(articleStr: String) {
        self.articleID = articleStr
        
        super.init(articleStr: articleStr)
    }
    
    private override func triggerImp(completion: ((AnyObject?)->(Void))) {
        super.triggerImp()
            { (passedData) in
                var vc = UIViewController()
                
                // Handle Deep Link Data to present the Article passed through
                if self.articleID == "A" {
                    vc = ViewControllerA()
                } else if self.articleID == "B" {
                    vc = ViewControllerB()
                } else if self.articleID == "C" {
                    vc = ViewControllerC()
                }
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.window?.addSubview(vc.view)
                
                completion(nil)
        }
    }
}

