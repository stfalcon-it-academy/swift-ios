//
//  Customer+CoreDataProperties.swift
//  core-data-habrahabr-swift
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Customer {
    @NSManaged var info: String?
    @NSManaged var name: String?
    @NSManaged var orders: NSSet?
}

