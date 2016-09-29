//
//  HotelTableViewCell.swift
//  SelfSizingCell
//
//  Created by Simon Ng on 17/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var addressLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!

    
    // MARK: - Class Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

