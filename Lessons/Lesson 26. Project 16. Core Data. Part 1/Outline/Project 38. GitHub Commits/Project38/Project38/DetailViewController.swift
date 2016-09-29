//
//  DetailViewController.swift
//  Project38
//
//  Created by Hudzilla on 26/01/2016.
//  Copyright © 2016 Paul Hudson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var detailItem: Commit? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Custom Functions
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.message
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit 1/\(detail.author.commits.count)", style: .Plain, target: self, action: #selector(showAuthorCommits))
            }
        }
    }

    func showAuthorCommits() {
        // this is your homework!
    }
}

