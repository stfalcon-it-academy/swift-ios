//
//  ServicesTableViewController.swift
//  core-data-habrahabr-swift

import UIKit
import CoreData

class ServicesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    typealias Select = (Service?) -> ()
    var didSelect: Select?

    var fetchedResultsController = CoreDataManager.instance.fetchedResultsController("Service", keyForSort: "name")

    @IBAction func AddService(sender: AnyObject) {
        performSegueWithIdentifier("servicesToService", sender: nil)
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
        let service = fetchedResultsController.objectAtIndexPath(indexPath) as! Service
        let cell = UITableViewCell()
        cell.textLabel?.text = service.name
        
        return cell
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
        let service = fetchedResultsController.objectAtIndexPath(indexPath) as? Service
        
        if let dSelect = self.didSelect {
            dSelect(service)
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            performSegueWithIdentifier("servicesToService", sender: service)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "servicesToService" {
            let controller = segue.destinationViewController as! ServiceViewController
            controller.service = sender as? Service
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
                let service = fetchedResultsController.objectAtIndexPath(indexPath) as! Service
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                cell!.textLabel?.text = service.name
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

