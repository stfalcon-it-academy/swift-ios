//
//  PhotoViewController.swift
//  CollectionViewDemo
//
//  Created by Simon Ng on 14/10/2015.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var photoImageView:UIImageView!
    
    var imageName:String = ""
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.image = UIImage(named: imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

