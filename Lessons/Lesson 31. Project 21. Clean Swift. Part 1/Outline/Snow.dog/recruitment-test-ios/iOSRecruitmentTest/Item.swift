//
//  Item.swift
//  iOSRecruitmentTest
//
//  Created by msm72 on 7/23/16.
//  Copyright © 2016 Snowdog. All rights reserved.
//

import Foundation
import CoreData
import Gloss

class Item: NSManagedObject, Decodable {
    // MARK: - Initialization
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    required init?(json: JSON) {
        super.init(entity: CoreDataManager.instance.entityForName("Item"), insertIntoManagedObjectContext: CoreDataManager.instance.managedObjectContext)
        
        parsing(json)
    }
    
    
    // MARK: - Custom Functions
    func parsing(json: JSON) {
        self.id = ("id" <~~ json)!
        self.name = ("name" <~~ json)!
        self.comment = ("description" <~~ json)!
        self.imageURL = ("icon" <~~ json)!
    }
}
