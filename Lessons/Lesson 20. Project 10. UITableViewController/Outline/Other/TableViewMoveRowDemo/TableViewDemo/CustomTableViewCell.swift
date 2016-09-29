//
//  CustomTableViewCell.swift
//  TableViewDemo
//
//  Created by msm72 on 7/2/16.
//  Copyright © 2016 Ravi Shankar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView?.frame = CGRectMake(15, 5, 50, 50)
        self.imageView?.contentMode = .ScaleAspectFit
        self.textLabel?.frame = CGRectMake(80, 5, CGRectGetWidth(self.frame) - 80 - 10, 50)
        self.separatorInset = UIEdgeInsetsMake(0, 80, 0, 15)
    }
}
