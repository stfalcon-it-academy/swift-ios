//
//  ViewController.swift
//  iOSRecruitmentTest
//
//  Created by Bazyli Zygan on 15.06.2016.
//  Copyright © 2016 Snowdog. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import Alamofire_Gloss

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var fetchedResultsController: NSFetchedResultsController?
    var searchPredicate: NSPredicate?

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Reloading...")
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), forControlEvents: .ValueChanged)
        
        return refreshControl
    }()

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        // Add UIRefreshControl
        tableView.addSubview(refreshControl)

        // Delegate
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        // Create 
        loadDataFromCoreData(withReloadData: false)
        
        // Get items
        guard fetchedResultsController?.fetchedObjects?.count > 0 else {
            print("Core Data is empty.")
            
            loadDataFromLocalHost()
            loadDataFromCoreData(withReloadData: true)
            
            return
        }
    }
    
    
    // MARK: - Custom Functions
    func loadDataFromLocalHost() {
        Alamofire.request(.GET, "http://localhost:8080/api/items", parameters: nil).responseArray(Item.self) { (response) in
            switch response.result {
            case .Success:
                // Core Data: manipulate
               dispatch_async(dispatch_get_main_queue()) {
                    // Core Data: add entities
                    CoreDataManager.instance.saveContext()
                
                    //self.loadDataFromCoreData()
                }
                
            case .Failure(let error):
                print("Error = \(error)")
            }
        }
    }
    
    func loadDataFromCoreData(withReloadData isReload: Bool) {
        if fetchedResultsController == nil {
            fetchedResultsController = CoreDataManager.instance.fetchedResultsController("Item", keyForSort: "id")
            
            // Delegate
            fetchedResultsController!.delegate = self
        }
        
        fetchedResultsController?.fetchRequest.predicate = searchPredicate
        
        do {
            try fetchedResultsController!.performFetch()
            
            if isReload {
                tableView.reloadData()
            }
        } catch {
            print("Fetch failed")
        }
    }

    func handleRefresh(refreshControl: UIRefreshControl) {
        let delayInSeconds: Int64 = 2
        let popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * Int64(NSEC_PER_SEC))
        
        dispatch_after(popTime, dispatch_get_main_queue()) { 
            NSURLCache.sharedURLCache().removeAllCachedResponses()
            
            // Core Data: delete all entities
            CoreDataManager.instance.cleanCoreData()
            self.loadDataFromCoreData(withReloadData: false)
            
            self.loadDataFromLocalHost()
            self.refreshControl.endRefreshing()
            self.loadDataFromCoreData(withReloadData: true)
        }
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController?.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell") as! TableViewCell
        
        cell.item = fetchedResultsController?.objectAtIndexPath(indexPath) as? Item
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if searchBar.isFirstResponder() {
            searchBar.resignFirstResponder()
            searchPredicate = nil
            
            loadDataFromCoreData(withReloadData: true)
        }
    }
}


// MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let attribute = "id"
        let filterValue = searchBar.text

        if let text = filterValue {
            searchPredicate = NSPredicate(format: "%K CONTAINS[c] %@", attribute, text)
        }
        
        loadDataFromCoreData(withReloadData: true)
        
        searchBar.resignFirstResponder()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchPredicate = nil
            
            loadDataFromCoreData(withReloadData: true)
            
            // Hide keyboard
            searchBar.performSelector(#selector(resignFirstResponder), withObject: nil, afterDelay: 0.1)
        }
    }
}


// MARK: - NSFetchedResultsControllerDelegate
extension ViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)

        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)

        default:
            break
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
}