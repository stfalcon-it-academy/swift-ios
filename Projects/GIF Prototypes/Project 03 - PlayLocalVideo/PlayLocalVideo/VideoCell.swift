//
//  VideoCell.swift
//  PlayLocalVideo
//
//  Created by Allen on 16/1/10.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

struct Video {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    
    
    // MARK: - Class Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
