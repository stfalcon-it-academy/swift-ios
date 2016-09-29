//
//  ViewController.swift
//  PropertyListTest
//
//  Created by Abhishek Mishra on 11/06/2015.
//  Copyright © 2015 asm technology ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var arrayOfContacts: NSArray? = nil
    
    @IBOutlet weak var userTableView: UITableView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load contacts.plist into arrayOfContacts
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let plistPath = documentsDirectory + "/contacts.plist"
        
        arrayOfContacts = NSArray(contentsOfFile: plistPath)
        
        // Delegates
        userTableView.dataSource = self
        userTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfContacts!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let contactName = arrayOfContacts![indexPath.row] as! String
        cell.textLabel?.text = contactName
     
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {}

