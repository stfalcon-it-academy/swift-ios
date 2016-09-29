//
//  Person.swift
//  Project10
//
//  Created by Hudzilla on 15/09/2015.
//  Copyright © 2015 Paul Hudson. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    // MARK: - Properties
	var name: String
	var image: String

    
    // MARK: - Initialization
	init(name: String, image: String) {
		self.name = name
		self.image = image
	}

	required init(coder aDecoder: NSCoder) {
		name = aDecoder.decodeObjectForKey("name") as! String
		image = aDecoder.decodeObjectForKey("image") as! String
	}

    
    // MARK: - Class Functions
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(name, forKey: "name")
		aCoder.encodeObject(image, forKey: "image")
	}
}
