//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Abhishek Mishra on 12/05/2015.
//  Copyright (c) 2015 asm technology ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var userCollectionView: UICollectionView!

    var statesOfMatter: Array<String> = ["Solid", "Liquid", "Gas"]
    
    var solids: Array<String> = ["Li", "Al", "Si"]
    
    var liquids: Array<String> = ["Hg"]
    
    var gasses: Array<String> = ["N", "O", "F"]
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegates
        userCollectionView.dataSource = self
        userCollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return statesOfMatter.count;
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return solids.count

        case 1:
            return liquids.count

        case 2:
            return gasses.count

        default:
            break
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ElementCellIdentifier", forIndexPath: indexPath) as! ElementCollectionViewCell
        
        switch indexPath.section {
        case 0:
            let elementName = solids[indexPath.row]
            cell.imageView.image = UIImage(named: elementName)

        case 1:
            let elementName = liquids[indexPath.row]
            cell.imageView.image = UIImage(named: elementName)

        case 2:
            let elementName = gasses[indexPath.row]
            cell.imageView.image = UIImage(named: elementName)

        default:
            break
        }
        
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate { }

