//
//  MenuTableViewController.swift
//  CoreDataPreloadDemo
//
//  Created by Simon Ng on 13/5/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//
//  CSV (comma-separated value)

import UIKit
import CoreData
import CSV

class MenuTableViewController: UITableViewController {
    // MARK: - Properties
    private var menuItems: [MenuItem] = []
    var fetchResultController: NSFetchedResultsController!
    let defaults = NSUserDefaults.standardUserDefaults()
    var needPreloadDataFromCSV: Bool!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make the cell self size
        tableView.estimatedRowHeight = 66.0
        tableView.rowHeight = UITableViewAutomaticDimension

        // Data - preload from CSV
        needPreloadDataFromCSV = defaults.boolForKey("needPreloadDataFromCSV")
        
        guard !needPreloadDataFromCSV else {
            preloadData()
            defaults.setBool(false, forKey: "needPreloadDataFromCSV")
            loadDataFromCoreData()
            
            return
        }

        // Data - load from Core Data
        loadDataFromCoreData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func handlerRefreshButtonTap(sender: UIBarButtonItem) {
        preloadData()
        loadDataFromCoreData()
        tableView.reloadData()
        defaults.setBool(false, forKey: "needPreloadDataFromCSV")
    }
    
    @IBAction func handlerDeleteButtonTap(sender: UIBarButtonItem) {
        removeData()
        defaults.setBool(true, forKey: "needPreloadDataFromCSV")
    }
    
    
    // MARK: - Custom Functions
    func preloadData() {
        // Retrieve data from the source file
        if let contentsOfURL = NSBundle.mainBundle().URLForResource("menudata", withExtension: "csv") {
            // Remove all the menu items before preloading
            removeData()
            
            if let items = parseCSV(contentsOfURL) {
                // Data - load from Core Data
                if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
                    for item in items {
                        let menuItem = NSEntityDescription.insertNewObjectForEntityForName("MenuItem", inManagedObjectContext: managedObjectContext) as! MenuItem
                        menuItem.name = item.name
                        menuItem.detail = item.detail
                        menuItem.price = (item.price as NSString).doubleValue

                        (UIApplication.sharedApplication().delegate as? AppDelegate)?.saveContext()
                    }
                }
            }
        }
    }
    
    func loadDataFromCoreData() {
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: "MenuItem")
            
            do {
                menuItems = try managedObjectContext.executeFetchRequest(fetchRequest) as! [MenuItem]
            } catch {
                print(#function + ": Failed to retrieve record")
                print(#function + ": \(error)")
            }
        }
    }
    
    func removeData() {
        // Remove the existing items
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: "MenuItem")
            
            do {
                let menuItems = try managedObjectContext.executeFetchRequest(fetchRequest) as! [MenuItem]
                
                for menuItem in menuItems {
                    managedObjectContext.deleteObject(menuItem)
                }
                
                self.menuItems = [MenuItem]()
                self.tableView.reloadData()
            } catch {
                print(#function + ": Failed to retrieve record: \(error)")
            }
        }
    }
    
    func parseCSV(contentsOfURL: NSURL) -> [(name:String, detail: String, price: String)]? {
        var items = [(name: String, detail: String, price: String)]()
        
        // Load the CSV file and parse it
        for row in try! CSV(path: contentsOfURL.path!) {
            // print("\(row)")
            
            let item = (name: row[0], detail: row[1], price: row[2])
            items.append(item)
        }
        
        return items
    }
}


// MARK: - UITableViewDataSource
extension MenuTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MenuTableViewCell
        let item = menuItems[indexPath.row] 
        
        cell.nameLabel.text = item.name
        cell.detailLabel.text = item.detail
        cell.priceLabel.text = "$\(item.price as! Double)"
        
        return cell
    }
}

