//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Ravi Shankar on 02/06/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class TableViewDemoController: UIViewController {
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    
    var data = [SocialMedia]()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        navigationItem.rightBarButtonItem = editButtonItem()
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        
        tableView.editing = editing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func handlerUnwindCancel(segue: UIStoryboardSegue) {
        // do nothing
    }
    
    @IBAction func handlerUnwindDone(segue: UIStoryboardSegue) {
        let detailViewController = segue.sourceViewController as! DetailViewController
        let socialMedia = detailViewController.socialMedia
        
        if let selectedIndex = detailViewController.index {
            data[selectedIndex] = socialMedia!
        } else {
//            data.append(socialMedia!)
            data.insert(socialMedia!, atIndex: 0)
        }
        
        tableView.reloadData()
    }
    
    @IBAction func handlerEditBarButtonTap(sender: UIBarButtonItem) {
        tableView.editing = !tableView.editing
    }
    
    
    // MARK: - Custom Functions
    func loadData() -> [SocialMedia] {
        data.append(SocialMedia(name: "Evernote", imageName: "evernote"))
        data.append(SocialMedia(name: "Facebook", imageName: "facebook"))
        data.append(SocialMedia(name: "GitHub", imageName: "github"))
        data.append(SocialMedia(name: "Google", imageName: "google"))
        data.append(SocialMedia(name: "LinkedIn", imageName: "linkedin"))
        data.append(SocialMedia(name: "Paypal", imageName: "paypal"))
        data.append(SocialMedia(name: "Pinterest", imageName: "pinterest"))
        data.append(SocialMedia(name: "Twitter", imageName: "twitter"))
        data.append(SocialMedia(name: "Vimeo", imageName: "vimeo"))
        data.append(SocialMedia(name: "YouTube", imageName: "youtube"))
        
        return data
    }

    
    // MARK: - Transition
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editAction" {
            let cell = sender as! UITableViewCell
            let selectedRow = tableView.indexPathForCell(cell)?.item
            let detailViewController:DetailViewController = segue.destinationViewController as! DetailViewController
            
            detailViewController.index = selectedRow
            detailViewController.socialMedia = data[selectedRow!]
        }
    }
}


// MARK: - UITableViewDataSource
extension TableViewDemoController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomTableViewCell
        
        let socialMedia = data[indexPath.row]
        cell.textLabel?.text = socialMedia.name
        cell.imageView?.image = socialMedia.image
        
        return cell
    }
}

    
// MARK: - UITableViewDelegate
extension TableViewDemoController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // Delete row from data source & tableView
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            // remove the deleted item from the model
            data.removeAtIndex(indexPath.row)
            
            // remove the deleted item from the `UITableView`
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        default:
            return
        }
        
    }
    
    // Move cell in section
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        // 1. delete moved row from data source
        let rowItem = data.removeAtIndex(sourceIndexPath.row)
        
        // 2. add moved row to new position with animation
        data.insert(rowItem, atIndex: destinationIndexPath.row)
    }
}

