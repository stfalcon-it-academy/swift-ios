//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 11/8/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit
import Social

class RestaurantTableViewController: UITableViewController {
    // MARK: - Properties
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - UITableViewDataSource
extension RestaurantTableViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return restaurantNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.favorIconImageView.hidden = !restaurantIsVisited[indexPath.row]

        // Circular image
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}


// MARK: - UITableViewDelegate
extension RestaurantTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Create an option menu as an action sheet
        let actionSheet = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        
        // Add Cancel action to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        // Add Call action to the menu
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)

        // Add I've been here action to the menu
        let isVisitedTitle = restaurantIsVisited[indexPath.row] ? "I haven't been to here before" : "I've been here"
        
        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .Default, handler: { (action:UIAlertAction) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! CustomTableViewCell
            
            // Toggle checkmark
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            cell.favorIconImageView.hidden = !self.restaurantIsVisited[indexPath.row]
        })
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(callAction)
        actionSheet.addAction(isVisitedAction)

        // Display the menu
        self.presentViewController(actionSheet, animated: true, completion: nil)        
        
        // Deselect the cell
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction] {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)

            // Twitter share
            let twitterActionHandler = { (action: UIAlertAction!) -> Void in
                if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
                    let tweetComposeVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                    tweetComposeVC.setInitialText(self.restaurantNames[indexPath.row])
                    tweetComposeVC.addImage(UIImage(named: self.restaurantImages[indexPath.row]))
                    
                    self.presentViewController(tweetComposeVC, animated: true, completion: nil)
                } else {
                    let alertMessage = UIAlertController(title: "Twitter Unavailable", message: "You haven't registered your Twitter account. Please go to Settings > Twitter to create one.",
                        preferredStyle: .Alert)
                    alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                    self.presentViewController(alertMessage, animated: true, completion: nil)
                }
            }

            let twitterAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.Default, handler: twitterActionHandler)
            
            
            // Facebook share
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
                    let facebookComposer = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                    facebookComposer.setInitialText(self.restaurantNames[indexPath.row])
                    facebookComposer.addImage(UIImage(named: self.restaurantImages[indexPath.row]))
                    facebookComposer.addURL(NSURL(string: "http://www.appcoda.com"))
                    
                    self.presentViewController(facebookComposer, animated: true, completion: nil)
                } else {
                    let alertMessage = UIAlertController(title: "Facebook Unavailable", message: "You haven't registered your Facebook account. Please go to Settings > Facebook to sign in or create one.",
                        preferredStyle: .Alert)
                    alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    
                    self.presentViewController(alertMessage, animated: true, completion: nil)
                }
            })
            
            
            // Cancel button
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
            }
        )
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete",handler: { (action:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            // Delete the row from the data source
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)

            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
        )
        
        shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)

        return [deleteAction, shareAction]
    }
}
