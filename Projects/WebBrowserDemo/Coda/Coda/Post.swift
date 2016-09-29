//
//  Post.swift
//  Coda
//
//  Created by Joyce Echessa on 1/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class Post: NSObject {
    // MARK: - Properties
    var postTitle: String = ""
    var postURL: String = ""
    
    
    // MARK: - Initialization
    init(dictionary: Dictionary<String, String>) {
        self.postTitle = dictionary["postTitle"]!
        self.postURL = dictionary["postURL"]!
        
        super.init()
    }
}