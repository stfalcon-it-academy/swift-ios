//
//  DetailsViewController.swift
//  Demo22-UITableView
//
//  Created by Prashant on 07/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    // MARK: - Properties
    var selectedItemName = "--"

    @IBOutlet var itemNameLabel: UILabel!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemNameLabel.text = selectedItemName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
