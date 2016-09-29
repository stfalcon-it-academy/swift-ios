//
//  ReportTableViewController.swift
//  core-data-habrahabr-swift

import UIKit
import CoreData

class ReportTableViewController: UITableViewController {
    
    var fetchRequest:NSFetchRequest = {
        var fetchRequest = NSFetchRequest(entityName: "Order")
        
        // Sort Descriptor
        let sortDescriptor1 = NSSortDescriptor(key: "date", ascending: true)
        let sortDescriptor2 = NSSortDescriptor(key: "customer.name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor1, sortDescriptor2]
        
        // Predicate
        let predicate = NSPredicate(format: "%K == %@ AND %K == %@", "made", true, "paid", false)
        fetchRequest.predicate = predicate
        
        return fetchRequest
    }()
    
    var report: [Order]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            report = try CoreDataManager.instance.managedObjectContext.executeFetchRequest(fetchRequest) as? [Order]
        } catch {
            print(error)
        }
    }
    
    // MARK: - Table View Data Source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let report = report {
            return report.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if let report = report {
            let order = report[indexPath.row]
            
            let formatter = NSDateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            let nameOfCustomer = (order.customer == nil) ? "-- Unknown --" : (order.customer!.name!)
            cell.textLabel?.text = formatter.stringFromDate(order.date) + "\t" + nameOfCustomer
        }
        
        return cell
    }
    
}
