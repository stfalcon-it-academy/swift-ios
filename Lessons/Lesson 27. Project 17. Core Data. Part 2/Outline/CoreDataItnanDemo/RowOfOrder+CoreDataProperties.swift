//
//  RowOfOrder+CoreDataProperties.swift
//  core-data-habrahabr-swift
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension RowOfOrder {
    @NSManaged var sum: Float
    @NSManaged var order: Order?
    @NSManaged var service: Service?
}
