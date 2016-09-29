//
//  Item+CoreDataProperties.swift
//  iOSRecruitmentTest
//
//  Created by msm72 on 7/23/16.
//  Copyright © 2016 Snowdog. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Item {
    // MARK: - Properties
    @NSManaged var name: String
    @NSManaged var comment: String?
    @NSManaged var imageURL: String?
    @NSManaged var id: NSNumber
}
