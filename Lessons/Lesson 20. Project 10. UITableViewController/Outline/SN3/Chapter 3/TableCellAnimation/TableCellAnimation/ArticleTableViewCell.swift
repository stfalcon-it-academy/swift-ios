//
//  ArticleTableViewCell.swift
//  TableCellAnimation
//
//  Created by Simon Ng on 18/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!

    
    // MARK: - Class Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

