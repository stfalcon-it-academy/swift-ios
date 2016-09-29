//
//  RestarauntsTableViewController.swift
//  Restaraunts
//
//  Created by Игорь on 19.11.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import UIKit
import CoreData

class RestarauntsTableViewController: UITableViewController {
    // MARK: - Properties
    var restaurants: [Restaurant] = []
    var fetchResultController: NSFetchedResultsController!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set NSFetchRequest - get objects data
        let fetchRequest = NSFetchRequest(entityName: "Restaurant")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
            
            // Delegates
            fetchResultController.delegate = self
            
            do {
                try fetchResultController.performFetch()
                restaurants = fetchResultController.fetchedObjects as! [Restaurant]
            } catch {
                print(error)
            }
        }
        
        // Удалить title у кнопки  back
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        // Cell auto height
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        prefersStatusBarHidden()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func unwindToRestaurants(segue: UIStoryboardSegue) {}

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! DetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
}


// MARK: - UITableViewDataSource
extension RestarauntsTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        
        // Настройка ячейки
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(data: restaurants[indexPath.row].image!)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        
        if let isVisited = restaurants[indexPath.row].isVisited?.boolValue {
            cell.accessoryType = isVisited ? .Checkmark : .None
        }
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension RestarauntsTableViewController {
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // Social
        let shareAction = UITableViewRowAction(style: .Default, title: "Share", handler: { (action, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            self.presentViewController(activityController, animated: true, completion: nil)
        })
        
        // Delete
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: { (action, indexPath) -> Void in
            self.restaurants.removeAtIndex(indexPath.row)
            
            if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
                let restarauntToDelete = self.fetchResultController.objectAtIndexPath(indexPath) as! Restaurant
                managedObjectContext.deleteObject(restarauntToDelete)
                
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error)
                }
            }
        })
        
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
}


// MARK: - NSFetchedResultsControllerDelegate
extension RestarauntsTableViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        if let _newIndexPath = newIndexPath {
            switch type {
            case .Insert:
                tableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Fade)
                
            case .Delete:
                tableView.deleteRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Fade)
                
            case .Update:
                tableView.reloadRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Fade)
                
            default:
                tableView.reloadData()
            }
            
            restaurants = controller.fetchedObjects as! [Restaurant]
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
}

