//
//  DetailViewController.swift
//  Project1
//
//  Created by Hudzilla on 13/09/2015.
//  Copyright © 2015 Paul Hudson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
	@IBOutlet weak var detailImageView: UIImageView!

	var detailItem: String? {
		didSet {
		    // Update the view
		    configureView()
		}
	}

    
    // MARK: - Class Functions
	override func viewDidLoad() {
		super.viewDidLoad()
		
        // Update the view
		configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.hidesBarsOnTap = true
	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
	}
    
    
    // MARK: - Custom Functions
    func configureView() {
        // Update the user interface for the detail item
        if let detail = detailItem {
            if let imageView = detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }
}

