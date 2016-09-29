//
//  ArticleTableViewController.swift
//  TableCellAnimation
//
//  Created by Simon Ng on 18/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController {
    // MARK: - Properties
    let postTitles = ["Use Background Transfer Service To Download File in Background",
                      "First Time App Developer Success Stories Part 1",
                      "Adding Animated Effects to iOS App Using UIKit Dynamics",
                      "Working with Game Center and Game Kit Framework",
                      "How to Access iOS Calendar, Events and Reminders",
                      "Creating Circular Profile Image"];
    
    let postImages = ["bts.jpg", "first-time-developer.jpg", "uidynamics.jpg", "gamecenter.jpg", "event-kit.jpg", "circular-image.jpg"];
    
    var postShown = [Bool](count: 6, repeatedValue: false)
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UITableViewDataSource
extension ArticleTableViewController {
    // Return the number of sections.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Return the number of rows in the section.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postTitles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ArticleTableViewCell
        
        // Configure the cell...
        cell.titleLabel.text = postTitles[indexPath.row]
        cell.postImageView.image = UIImage(named: postImages[indexPath.row])
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ArticleTableViewController {
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // Determine if the post is displayed. If yes, we just return and no animation will be created
        if postShown[indexPath.row] {
            return
        }
        
        // Indicate the post has been displayed, so the animation won't be displayed again
        postShown[indexPath.row] = true
        
        // Define the initial state (Before the animation)
        let rotationAngleInRadians = 90.0 * CGFloat(M_PI/180.0)
        let rotationTransform = CATransform3DMakeRotation(rotationAngleInRadians, 0, 0, 1)
        cell.layer.transform = rotationTransform
        
        // Define the final state (After the animation)
        UIView.animateWithDuration(1.0, animations: { cell.layer.transform = CATransform3DIdentity })
        
        //        // Define the initial state (Before the animation)
        //        let rotationAngleInRadians = 90.0 * CGFloat(M_PI/180.0)
        //        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        //        cell.layer.transform = rotationTransform
        //
        //        // Define the final state (After the animation)
        //        UIView.animateWithDuration(1.0, animations: { cell.layer.transform = CATransform3DIdentity })
    }
}
