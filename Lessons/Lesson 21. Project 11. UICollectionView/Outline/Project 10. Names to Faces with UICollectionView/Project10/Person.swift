//
//  Person.swift
//  Project10
//
//  Created by Hudzilla on 15/09/2015.
//  Copyright © 2015 Paul Hudson. All rights reserved.
//

import UIKit

class Person: NSObject {
    // MARK: - Properties
	var name: String
	var image: String

    
    // MARK: - Initialization
	init(name: String, image: String) {
		self.name = name
		self.image = image
	}
}
