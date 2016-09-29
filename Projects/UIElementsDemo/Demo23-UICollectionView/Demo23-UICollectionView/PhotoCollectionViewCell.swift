//
//  PhotoCollectionViewCell.swift
//  Demo23-UICollectionView
//
//  Created by Prashant on 08/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    // outlet - image view
    @IBOutlet var photoImageView: UIImageView!
    
    
    // MARK: - Custom Functions
    // set corner radious for image view
    func setCornerRadious(radious: Int) {
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = CGFloat(radious)
    }
}
