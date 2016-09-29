//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Simon Ng on 15/8/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    
    
    // MARK: - Class Functions
    override func awakeFromNib() {
        super.awakeFromNib()

        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

