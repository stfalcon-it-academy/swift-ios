//
//  OrderViewController.swift
//  core-data-habrahabr-swift

import UIKit
import CoreData

class OrderViewController: UIViewController, NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate {

    var order: Order?
    var table: NSFetchedResultsController?
    
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var textFieldCustomer: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var switchMade: UISwitch!
    @IBOutlet weak var switchPaid: UISwitch!

    @IBAction func save(sender: AnyObject) {
        saveOrder()
        dismissViewControllerAnimated(true, completion: nil)
   }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func choiceCustomer(sender: AnyObject) {
        performSegueWithIdentifier("orderToCustomers", sender: nil)
    }
    
    @IBAction func AddRowOfOrder(sender: AnyObject) {
        if let order = order {
            let newRowOfOrder = RowOfOrder()
            newRowOfOrder.order = order
            performSegueWithIdentifier("orderToRowOfOrder", sender: newRowOfOrder)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if order == nil {
            order = Order()
            order!.date = NSDate()
        }

        if let order = order {
            dataPicker.date = order.date
            switchMade.on = order.made
            switchPaid.on = order.paid
            textFieldCustomer.text = order.customer?.name
            table = Order.getRowsOfOrder(order)
            table!.delegate = self
            do {
                try table!.performFetch()
            } catch {
                print(error)
            }
        }
    }

    func saveOrder() {
        if let order = order {
            order.date = dataPicker.date
            order.made = switchMade.on
            order.paid = switchPaid.on
            CoreDataManager.instance.saveContext()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier! {
            
        case "orderToCustomers":
            let viewController = segue.destinationViewController as! CustomersTableViewController
            viewController.didSelect = { [unowned self] (customer) in
                if let customer = customer {
                    self.order?.customer = customer
                    self.textFieldCustomer.text = customer.name!
                }
            }

        case "orderToRowOfOrder":
            let controller = segue.destinationViewController as! RowOfOrderViewController
            controller.rowOfOrder = sender as? RowOfOrder

        default:
            break
        }
    }
    
    // MARK: - Table View Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = table?.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let rowOfOrder = table?.objectAtIndexPath(indexPath) as! RowOfOrder
        let cell = UITableViewCell()
        let nameOfService = (rowOfOrder.service == nil) ? "-- Unknown --" : (rowOfOrder.service!.name!)
        cell.textLabel?.text = nameOfService + " - " + String(rowOfOrder.sum)
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let managedObject = table?.objectAtIndexPath(indexPath) as! NSManagedObject
            CoreDataManager.instance.managedObjectContext.deleteObject(managedObject)
            CoreDataManager.instance.saveContext()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let rowOfOrder = table?.objectAtIndexPath(indexPath) as! RowOfOrder
        performSegueWithIdentifier("orderToRowOfOrder", sender: rowOfOrder)
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
                let rowOfOrder = table?.objectAtIndexPath(indexPath) as! RowOfOrder
                let cell = tableView.cellForRowAtIndexPath(indexPath)!
                let nameOfService = (rowOfOrder.service == nil) ? "-- Unknown --" : (rowOfOrder.service!.name!)
                cell.textLabel?.text = nameOfService + " - " + String(rowOfOrder.sum)
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
