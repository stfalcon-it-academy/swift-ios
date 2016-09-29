//
//  Order+CoreDataProperties.swift
//  core-data-habrahabr-swift
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Order {
    @NSManaged var date: NSDate
    @NSManaged var made: Bool
    @NSManaged var paid: Bool
    @NSManaged var customer: Customer?
    @NSManaged var rowsOfOrder: NSSet?
}

