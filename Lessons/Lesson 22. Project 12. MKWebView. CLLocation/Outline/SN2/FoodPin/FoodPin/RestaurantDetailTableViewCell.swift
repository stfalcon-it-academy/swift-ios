//
//  RestaurantDetailTableViewCell.swift
//  FoodPin
//
//  Created by Simon Ng on 24/8/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailTableViewCell: UITableViewCell {
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
