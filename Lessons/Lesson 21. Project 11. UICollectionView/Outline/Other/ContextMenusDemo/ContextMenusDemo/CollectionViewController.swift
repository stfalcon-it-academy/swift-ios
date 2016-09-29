//
//  CollectionViewController.swift
//  ContextMenusDemo
//
//  Created by msm72 on 7/4/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    // MARK: - Properties
    var cellData = [String]()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //self.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        for i in 0...20 {
            cellData.append(String(i))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UICollectionViewDataSource
extension CollectionViewController {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellData.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        // Configure the cell
        cell.label.text = cellData[indexPath.row]
        
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension CollectionViewController {
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        // no copy option please
//        if NSStringFromSelector(action) == "copy:" {
//            return false
//        }
        
        return true
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        // Cut
        if NSStringFromSelector(action) == "cut:" {
            // grab our value
            let value = String(indexPath.row)
            
            // copy object to pasteboard
            UIPasteboard.generalPasteboard().string = value
            
            // remove item
            cellData.removeAtIndex(indexPath.row)
            collectionView.deleteItemsAtIndexPaths([indexPath])
        }
        
        // Copy
        if NSStringFromSelector(action) == "copy:" {
            // grab our value
            let value = String(indexPath.row)
            
            // copy object to pasteboard
            UIPasteboard.generalPasteboard().string = value
        }
        
        // Paste
        if NSStringFromSelector(action) == "paste:" {
            // grab our value
            let value = UIPasteboard.generalPasteboard().string
            
            // insert at current position
            cellData.insert(value!, atIndex: indexPath.row)
            collectionView.insertItemsAtIndexPaths([indexPath])
        }
    }
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
}
