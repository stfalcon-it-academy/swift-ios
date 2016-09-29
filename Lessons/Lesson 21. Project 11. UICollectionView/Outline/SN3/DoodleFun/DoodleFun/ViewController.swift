//
//  ViewController.swift
//  DoodleFun
//
//  Created by Simon Ng on 19/1/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var doodleImages = ["DoodleIcons-1", "DoodleIcons-2", "DoodleIcons-3", "DoodleIcons-4", "DoodleIcons-5", "DoodleIcons-6", "DoodleIcons-7", "DoodleIcons-8", "DoodleIcons-9", "DoodleIcons-10", "DoodleIcons-11", "DoodleIcons-12", "DoodleIcons-13", "DoodleIcons-14", "DoodleIcons-15", "DoodleIcons-16", "DoodleIcons-17", "DoodleIcons-18", "DoodleIcons-19", "DoodleIcons-20"]
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(traitCollection)")
        
        // Delegates
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - UIContentContainer (Rotation)
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }
}


// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doodleImages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CustomCollectionViewCell
        
        cell.imageView.image = UIImage(named: doodleImages[indexPath.row])
        
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size
        let collectionViewArea = Double(collectionViewSize.width * collectionViewSize.height)
        let sideSize: Double = sqrt(collectionViewArea / (Double(doodleImages.count))) - 30.0
        
        return CGSize(width: sideSize, height: sideSize)
    }
}

