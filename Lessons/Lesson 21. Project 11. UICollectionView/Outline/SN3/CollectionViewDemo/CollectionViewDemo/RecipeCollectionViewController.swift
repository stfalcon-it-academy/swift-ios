//
//  RecipeCollectionViewController.swift
//  CollectionViewDemo
//
//  Created by Simon Ng on 13/10/2015.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class RecipeCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    var recipeImages = ["angry_birds_cake", "creme_brelee", "egg_benedict", "full_breakfast", "green_tea", "ham_and_cheese_panini", "ham_and_egg_sandwich", "hamburger", "instant_noodle_with_egg.jpg", "japanese_noodle_with_pork", "mushroom_risotto", "noodle_with_bbq_pork", "starbucks_coffee", "thai_shrimp_cake", "vegetable_curry", "white_chocolate_donut"]
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UICollectionViewDataSource
extension RecipeCollectionViewController {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeImages.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! RecipeCollectionViewCell
    
        // Configure the cell
        cell.recipeImageView.image = UIImage(named: recipeImages[indexPath.row])
        cell.backgroundView = UIImageView(image: UIImage(named: "photo-frame"))
    
        return cell
    }
}

