//
//  ViewController.swift
//  Notes
//
//  Created by Malek T. on 5/28/15.
//  Copyright (c) 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // MARK: - Properties
    var notesArray: NSMutableArray!
    var plistPath: String!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        plistPath = appDelegate.plistPathInDocument
        
        // Extract the content of the file as NSData
        let data: NSData = NSFileManager.defaultManager().contentsAtPath(plistPath)!
        
        do {
            notesArray = try NSPropertyListSerialization.propertyListWithData(data, options: .MutableContainersAndLeaves, format: nil) as! NSMutableArray
        } catch {
            print("Error occured while reading from the plist file")
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func editTable(sender: AnyObject) {
        if self.tableView.editing{
            let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: #selector(ViewController.editTable(_:)))
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
            self.tableView.setEditing(false, animated: true)
        } else {
            let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(ViewController.editTable(_:)))
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
            self.tableView.setEditing(true, animated: true)
        }
    }
}


// MARK: - UITableViewDataSource
extension ViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier")!
        
        cell.textLabel!.text = notesArray.objectAtIndex(indexPath.row) as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // remove the row from the array
        notesArray.removeObjectAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        notesArray.writeToFile(plistPath, atomically: true)
    }
}

