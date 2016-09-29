//
//  Customer.swift
//  core-data-habrahabr-swift

import Foundation
import CoreData

class Customer: NSManagedObject {
    // MARK: - Initialization
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName("Customer"), insertIntoManagedObjectContext: CoreDataManager.instance.managedObjectContext)
    }
}

