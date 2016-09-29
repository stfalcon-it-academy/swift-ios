//
//  DetailViewController.swift
//  Project5
//
//  Created by Hudzilla on 13/09/2015.
//  Copyright © 2015 Paul Hudson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
	@IBOutlet weak var detailDescriptionLabel: UILabel!

	var detailItem: AnyObject? {
		didSet {
		    // Update the view.
		    self.configureView()
		}
	}

    
    // MARK: - Class Functions
    override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.configureView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
    
    // MARK: - Custom Functions
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }
}

