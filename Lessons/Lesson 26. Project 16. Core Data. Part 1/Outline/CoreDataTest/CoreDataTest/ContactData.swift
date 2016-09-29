//
//  ContactData.swift
//  CoreDataTest
//
//  Created by Abhishek Mishra on 09/06/2015.
//  Copyright (c) 2015 asm technology ltd. All rights reserved.
//

import Foundation
import CoreData

class ContactData: NSManagedObject {
    // MARK: - Properties
    @NSManaged var customerName: String
    @NSManaged var phoneNumber: String
    @NSManaged var postCode: String
}

