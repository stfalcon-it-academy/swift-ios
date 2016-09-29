//
//  ViewController.swift
//  NSURLSessionTutorial
//
//  Created by msm72 on 6/19/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var requestStringURL: String!
    var url: NSURL!
    var session: NSURLSession!
    var request: NSMutableURLRequest!
    
    
    // MARK: - Initialization
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        requestStringURL = "http://www.kaleidosblog.com/tutorial/nsurlsession_tutorial.php"
        url = NSURL(string: requestStringURL)!
        session = NSURLSession.sharedSession()
        request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
    }

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data_request()
        download_request()
        upload_request()
    }
    

    // MARK: - Custom Functions
    func data_request() {
        let paramString = "data=Hello"
        request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        
        // The dataTaskWithRequest is for normal data requests (when for example you'll have to ask to a web server for some data)
        let task = session.dataTaskWithRequest(request) {(let data, let response, let error) in
            guard let _: NSData = data, let _: NSURLResponse = response  where error == nil else {
                print("error")
                
                return
            }
            
            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            print(dataString!)
        }
        
        task.resume()
    }
    
    func download_request() {
        let paramString = "data=Hello"
        request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        
        // The downloadTaskWithRequest is for downloading files
        let task = session.downloadTaskWithRequest(request) {(let location, let response, let error) in
            guard let _: NSURL = location, let _: NSURLResponse = response  where error == nil else {
                print("error")
                
                return
            }
            
            let urlContents = try! NSString(contentsOfURL: location!, encoding: NSUTF8StringEncoding)
            
            guard let _: NSString = urlContents else {
                print("error")
                
                return
            }
            
            print(urlContents)
        }
        
        task.resume()
    }
    
    func upload_request() {
        let data = "data=Hi".dataUsingEncoding(NSUTF8StringEncoding)
        
        // The uploadTaskWithRequest is for uploading data
        let task = session.uploadTaskWithRequest(request, fromData: data, completionHandler: {(data, response, error) in
                guard let _: NSData = data, let _: NSURLResponse = response  where error == nil else {
                    print("error")
                    
                    return
                }
                
                let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
               
                print(dataString!)
            }
        )
        
        task.resume()
    }
}
