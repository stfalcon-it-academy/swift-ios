//
//  AboutTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 8/9/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {

    var sectionTitles = [NSLocalizedString("Leave Feedback", comment: "Leave Feedback"), NSLocalizedString("Follow Us", comment: "Follow Us")]
    var sectionContent = [[NSLocalizedString("Rate us on App Store", comment: "Rate us on App Store"), NSLocalizedString("Tell us your feedback", comment: "Tell us your feedback")],
        [NSLocalizedString("Twitter", comment: "Twitter"), NSLocalizedString("Facebook", comment: "Facebook"), NSLocalizedString("Pinterest", comment: "Pinterest")]]
    var links = ["https://twitter.com/appcodamobile", "https://facebook.com/appcodamobile", "https://www.pinterest.com/appcoda/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Remove the separators of the empty rows
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 3
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.section {
            
        // Leave feedback section
        case 0:
            if indexPath.row == 0 {
                if let url = NSURL(string: "http://www.apple.com/itunes/charts/paid-apps/") {
                    UIApplication.sharedApplication().openURL(url)
                }
            } else if indexPath.row == 1 {
                performSegueWithIdentifier("showWebView", sender: self)
            }
            
        // Follow Us section
        case 1:
            if let url = NSURL(string: links[indexPath.row]) {
                let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
                presentViewController(safariController, animated: true, completion: nil)
            }
            
        default:
            break
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
