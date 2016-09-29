//
//  CollectionViewCell.swift
//  UICollectionViewCircularImages
//
//  Created by msm72 on 7/4/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - Class Functions
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        makeItCircle()
    }
    
    func makeItCircle() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius  = CGFloat(roundf(Float(imageView.frame.size.width / 2.0)))
    }
}
