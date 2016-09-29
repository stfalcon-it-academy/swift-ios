//
//  WidgetViewController.swift
//  CSBooksDemo
//
//  Created by msm72 on 8/1/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit
import NotificationCenter
import Books

class WidgetViewController: UIViewController, NCWidgetProviding {
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
   
    var booksArray = [Book]()

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize = CGSizeMake(320, 180)
        
        // Delegates
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.readPropertyList()
    }
    
    
    // MARK: - Custom Functions
    func titleFromSharedDefaults() -> String {
        let sharedDefaults = NSUserDefaults(suiteName: "group.com.stfalcon.CSBooksDemo")!
        
        if let titleText = sharedDefaults.stringForKey("ExtensionTitleKey") {
            return titleText
        }
        
        return ""
    }
    
    func readPropertyList() {
        if let filePath = SharedBooksManager.urlForSharedBooksArray() {
            booksArray = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? [Book] ?? [Book]()
        }
    }
}


// MARK: - UITableViewDataSource
extension WidgetViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.booksArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CSBookCell", forIndexPath: indexPath)
        let currentBook = self.booksArray[indexPath.row]
        
        cell.textLabel?.text = currentBook.title
        cell.detailTextLabel?.text = currentBook.author
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension WidgetViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleFromSharedDefaults()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clearColor()
        
        let headerView = (view as! UITableViewHeaderFooterView)
        headerView.textLabel?.textColor = UIColor.whiteColor()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

