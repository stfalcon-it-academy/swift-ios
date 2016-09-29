//
//  RowOfOrder.swift
//  core-data-habrahabr-swift

import Foundation
import CoreData

class RowOfOrder: NSManagedObject {
    // MARK: - Initialization
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName("RowOfOrder"), insertIntoManagedObjectContext: CoreDataManager.instance.managedObjectContext)
    }
}

