//
//  DetailViewController.swift
//  Project1
//
//  Created by Hudzilla on 13/09/2015.
//  Copyright © 2015 Paul Hudson. All rights reserved.
//

import Social
import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
	@IBOutlet weak var detailImageView: UIImageView!

	var detailItem: String? {
		didSet {
		    // Update the view.
		    configureView()
		}
	}

    
    // MARK: - Class Functions
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
        configureView()
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareTapped))
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
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }
    
    func shareTapped() {
        if let currentImage = detailImageView.image {
            let activityVC = UIActivityViewController(activityItems: [currentImage], applicationActivities: [])
            activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            
            presentViewController(activityVC, animated: true, completion: nil)
        }
	}

//	func shareTapped() {
//		let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
//		vc.setInitialText("Look at this great picture!")
//		vc.addImage(detailImageView.image!)
//		vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
//		presentViewController(vc, animated: true, completion: nil)
//	}
}

