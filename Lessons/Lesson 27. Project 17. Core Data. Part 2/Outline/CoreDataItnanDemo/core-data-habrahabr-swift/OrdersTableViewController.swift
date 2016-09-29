//
//  OrdersTableViewController.swift
//  core-data-habrahabr-swift

import UIKit
import CoreData

class OrdersTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var fetchedResultsController = CoreDataManager.instance.fetchedResultsController("Order", keyForSort: "date")

    @IBAction func AddOrder(sender: AnyObject) {
        performSegueWithIdentifier("ordersToOrder", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let order = fetchedResultsController.objectAtIndexPath(indexPath) as! Order
        configCell(cell, order: order)
        return cell
    }
    
    func configCell(cell: UITableViewCell, order: Order) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        let nameOfCustomer = (order.customer == nil) ? "-- Unknown --" : (order.customer!.name!)
        cell.textLabel?.text = formatter.stringFromDate(order.date) + "\t" + nameOfCustomer
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let managedObject = fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
            CoreDataManager.instance.managedObjectContext.deleteObject(managedObject)
            CoreDataManager.instance.saveContext()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let order = fetchedResultsController.objectAtIndexPath(indexPath) as? Order
        performSegueWithIdentifier("ordersToOrder", sender: order)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ordersToOrder" {
            let controller = segue.destinationViewController as! OrderViewController
            controller.order = sender as? Order
        }
    }
    // MARK: - Fetched Results Controller Delegate
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        
        switch type {
            
        case .Insert:
            if let indexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
            
        case .Update:
            if let indexPath = indexPath {
                let order = fetchedResultsController.objectAtIndexPath(indexPath) as! Order
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                configCell(cell!, order: order)
            }
            
        case .Move:
            if let indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
            if let newIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Automatic)
            }
            
        case .Delete:
            if let indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }

}
