//
//  ViewController.swift
//  UICollectionViewCreateProgrammatically
//
//  Created by msm72 on 7/4/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    private let barSize: CGFloat = 44.0
    private let kCellReuse = "PackCell"
    private let kCellheaderReuse = "PackHeader"
    private var collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegates
        collectionView.delegate = self
        collectionView.dataSource = self
       
        collectionView.backgroundColor = UIColor.clearColor()
        
        // Register parts(header and cell)
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: kCellReuse)
        collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCellheaderReuse)
        
        self.view.addSubview(collectionView)
    }
    
    override func viewWillLayoutSubviews() {
        let frame = self.view.frame
        collectionView.frame = CGRectMake(frame.origin.x, frame.origin.y + barSize, frame.size.width, frame.size.height - barSize)
    }
}


// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var res = 0
        
        switch(section) {
        case 0:
            res = 24

        default:
            break
        }

        return res
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kCellReuse, forIndexPath: indexPath)// as PackViewCell
        
        cell.backgroundColor = UIColor.orangeColor()
        
        return cell
    }
}



// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: false)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var reusableView: UICollectionReusableView? = nil
        
        // Create header
        if (kind == UICollectionElementKindSectionHeader) {
            // Create Header
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: kCellheaderReuse, forIndexPath: indexPath)
            headerView.backgroundColor = UIColor.blueColor()
            
            reusableView = headerView
        }
        
        return reusableView!
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(self.view.frame.width, 90)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let frame = self.view.frame
        let margin  = (frame.width - 90 * 3) / 6.0
        
        return UIEdgeInsetsMake(10, margin, 10, margin)
    }
}

