//
//  ViewController.swift
//  Demo23-UICollectionView
//
//  Created by Prashant on 08/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    //  photo list - Image name
    var photoList = [ "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6" ]
    
    // corner radious for image/photo
    var photoCornerRadious : Int = 0
    
    // outlet - collection view
    @IBOutlet var photosCollectionView: UICollectionView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set collection view data source and delegate
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    // action - radious change stepper
    @IBAction func radiousStepperAction(sender: UIStepper) {
        // set new radious
        photoCornerRadious = Int(sender.value)
        
        // reload collection view
        photosCollectionView.reloadData()
    }
}


// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    // number of sections within collection
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // number of items/records within section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoList.count
    }
    
    // set cell content and return it
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // collect reusable cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath: indexPath) as! PhotoCollectionViewCell
        
        // set corner radious
        cell.setCornerRadious(photoCornerRadious)
        
        // set image within cell
        cell.photoImageView.image = UIImage(named: photoList[indexPath.row])
        
        // return cell
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
}
