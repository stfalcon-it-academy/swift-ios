//
//  RestaurantDetailCell.swift
//  Restaraunts
//
//  Created by Игорь on 01.12.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import UIKit

class RestaurantDetailCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet var fieldLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    // MARK: - Class Functions
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

