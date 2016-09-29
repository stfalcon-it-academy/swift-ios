//
//  Order.swift
//  core-data-habrahabr-swift

import Foundation
import CoreData

class Order: NSManagedObject {
    // MARK: - Initialization
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName("Order"), insertIntoManagedObjectContext: CoreDataManager.instance.managedObjectContext)
    }

    
    // MARK: - Custom Functions
    class func getRowsOfOrder(order: Order) -> NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(entityName: "RowOfOrder")
        let sortDescriptor = NSSortDescriptor(key: "service.name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate(format: "%K == %@", "order", order)
        fetchRequest.predicate = predicate
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.instance.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        return fetchedResultsController
    }
}

