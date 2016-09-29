//
//  HomeViewController.swift
//  Carousel Effect
//
//  Created by Allen on 16/1/11.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var currentUserProfileImageButton: UIButton!
    @IBOutlet weak var currentUSerFullNameButton: UIButton!
    
    private var interests = Interest.createInterests()

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    // MARK: - Custom Functions
    private struct Storyboard {
        static let CellIdentifier = "InterestCell"
    }
}


// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! InterestCollectionViewCell
        
        cell.interest = self.interests[indexPath.item]
        
        return cell
    }
}
