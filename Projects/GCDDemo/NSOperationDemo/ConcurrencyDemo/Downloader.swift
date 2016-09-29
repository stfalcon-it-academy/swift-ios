//
//  Downloader.swift
//  ConcurrencyDemo
//
//  Created by msm72 on 6/29/16.
//  Copyright © 2016 Hossam Ghareeb. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://algoos.com/wp-content/uploads/2015/08/ireland-02.jpg", "http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"]

class Downloader {
    // MARK: - Class Functions
    class func downloadImageWithURL(url:String) -> UIImage! {
        let data = NSData(contentsOfURL: NSURL(string: url)!)
        
        return UIImage(data: data!)
    }
}

