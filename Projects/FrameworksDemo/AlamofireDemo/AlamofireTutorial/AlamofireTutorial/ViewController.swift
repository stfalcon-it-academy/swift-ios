//
//  ViewController.swift
//  AlamofireTutorial
//
//  Created by msm72 on 6/19/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var requestActivity: UIActivityIndicatorView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Custom Functions
    func getData() {
        requestActivity.startAnimating()
        
        Alamofire.request(.GET, "http://swiftbook.ru/json/JSONdata.json", parameters: [:]) .responseJSON { response in
            print("1. request = \(response.request!)")      // original URL request
            print("2. response = \(response.response!)")    // URL response
            print("3. data = \(response.data!)")            // server data
            print("4. result = \(response.result)")        // result of response serialization
            
            if let JSON = response.result.value {
                print("5. JSON: \(JSON)")
                print("6. JSON cities = \(JSON["Europe"] as! NSDictionary)")
                print("7. JSON city Minsk = \(JSON.valueForKeyPath("Europe.Minsk") as! NSDictionary)")
            }
            
            // Create delay 2 seconds
            sleep(2)
            self.requestActivity.stopAnimating()
        }
    }
}

