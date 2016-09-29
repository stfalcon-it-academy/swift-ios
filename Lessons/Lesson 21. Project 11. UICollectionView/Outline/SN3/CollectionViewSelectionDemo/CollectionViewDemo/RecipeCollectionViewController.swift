//
//  RecipeCollectionViewController.swift
//  CollectionViewDemo
//
//  Created by Simon Ng on 13/10/2015.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit
import Social

private let reuseIdentifier = "Cell"

class RecipeCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    var recipeImages = ["angry_birds_cake", "creme_brelee", "egg_benedict", "full_breakfast", "green_tea", "ham_and_cheese_panini", "ham_and_egg_sandwich", "hamburger", "instant_noodle_with_egg.jpg", "japanese_noodle_with_pork", "mushroom_risotto", "noodle_with_bbq_pork", "starbucks_coffee", "thai_shrimp_cake", "vegetable_curry", "white_chocolate_donut"]
    
    @IBOutlet var shareButton:UIBarButtonItem!
    
    var shareEnabled = false
    var selectedRecipes:[String] = []
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func shareButtonTapped(sender: AnyObject) {
        // Check if the sharing mode is enabled, otherwise, just leave this method
        guard shareEnabled else {
            // If sharing is not enable, change shareEnabled to true and change the button text to Upload
            shareEnabled = true
            collectionView?.allowsMultipleSelection = true
            shareButton.title = "Upload"
            shareButton.style = UIBarButtonItemStyle.Done
            
            return
        }
        
        // Check if there is any selected recipes, otherwise, just leave this method
        guard selectedRecipes.count > 0 else {
            return
        }
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let facebookComposer = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookComposer.setInitialText("Check out my recipes!")
            
            for recipePhoto in selectedRecipes {
                facebookComposer.addImage(UIImage(named: recipePhoto))
            }
            
            presentViewController(facebookComposer, animated: true, completion: nil)
        } else {
            self.showAlertMessage("You are not connected to your Facebook account.")
        }
        
        // Deselect all selected items
        if let indexPaths = collectionView?.indexPathsForSelectedItems() {
            for indexPath in indexPaths {
                collectionView?.deselectItemAtIndexPath(indexPath, animated: false)
            }
        }
        
        // Remove all items from selectedRecipes array
        selectedRecipes.removeAll(keepCapacity: true)
        
        // Change the sharing mode to NO
        shareEnabled = false
        collectionView?.allowsMultipleSelection = false
        shareButton.title = "Share"
        shareButton.style = UIBarButtonItemStyle.Plain
    }
    
    
    // MARK: - Custom Functions
    func showAlertMessage(message: String!) {
        let alertController = UIAlertController(title: "Info", message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
    }

    
    // MARK: - Navigation
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRecipePhoto" {
            if let indexPaths = collectionView?.indexPathsForSelectedItems() {
                let destinationViewController = segue.destinationViewController as! UINavigationController
                let photoViewController = destinationViewController.viewControllers[0] as! PhotoViewController
                photoViewController.imageName = recipeImages[indexPaths[0].row]
                
                collectionView?.deselectItemAtIndexPath(indexPaths[0], animated: false)
            }
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "showRecipePhoto" {
            if shareEnabled {
                return false
            }
        }
        
        return true
    }
}


// MARK:  - UICollectionViewDataSource
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
        cell.selectedBackgroundView = UIImageView(image: UIImage(named: "photo-frame-selected"))
    
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension RecipeCollectionViewController {
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // Check if the sharing mode is enabled, otherwise, just leave this method
        guard shareEnabled else {
            return
        }
        
        // Determine the selected items by using the indexPath
        let selectedRecipe = recipeImages[indexPath.row]
        
        // Add the selected item into the array
        selectedRecipes.append(selectedRecipe)
    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        // Check if the sharing mode is enabled, otherwise, just leave this method
        guard shareEnabled else {
            return
        }
        
        let deSelectedRecipe = recipeImages[indexPath.row]
        
        if let index = recipeImages.indexOf(deSelectedRecipe) {
            recipeImages.removeAtIndex(index)
        }
    }
}
