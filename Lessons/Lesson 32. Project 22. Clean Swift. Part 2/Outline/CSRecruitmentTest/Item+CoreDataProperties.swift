//
//  Item+CoreDataProperties.swift
//  
//
//  Created by msm72 on 09.08.16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {

    @NSManaged var comment: String?
    @NSManaged var id: Int64
    @NSManaged var imageURL: String?
    @NSManaged var name: String?

}
