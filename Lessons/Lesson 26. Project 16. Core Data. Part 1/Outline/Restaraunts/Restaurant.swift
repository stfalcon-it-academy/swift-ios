//
//  Restaurant.swift
//  Restaraunts
//
//  Created by Игорь on 10.12.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import Foundation
import CoreData


class Restaurant: NSManagedObject {
    // MARK: - Properties
    @NSManaged var name: String
    @NSManaged var type: String
    @NSManaged var location: String
    @NSManaged var isVisited: NSNumber?
    @NSManaged var image: NSData?
    @NSManaged var rating: String?
    @NSManaged var phoneNumber: String?
}

