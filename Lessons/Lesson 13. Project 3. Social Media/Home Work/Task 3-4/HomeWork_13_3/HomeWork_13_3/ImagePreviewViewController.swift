//
//  ImagePreviewViewController.swift
//  HomeWork_13_3
//
//  Created by msm72 on 6/12/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("ImagePreviewViewController \(#function) run.")
    }
}
