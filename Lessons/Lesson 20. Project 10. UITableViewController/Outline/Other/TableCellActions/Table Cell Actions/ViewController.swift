//
//  ViewController.swift
//  Table Cell Actions
//
//  Created by Brian Coleman on 2015-05-04.
//  Copyright (c) 2015 Brian Coleman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var tableView = UITableView()
    
    let showsArray = ["House of Cards", "Arrested Development", "Orange is the New Black", "Unbreakable", "Daredevil", "The Killing", "BoJack Horseman", "Mad Men", "Breaking Bad", "Bates Motel"]
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView = UITableView(frame: self.view.frame)
        tableView.separatorColor = UIColor.clearColor()
        self.view.addSubview(tableView)
        
        // Delegates
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellFrame = CGRectMake(0, 0, self.tableView.frame.width, 52.0)
        let retCell = UITableViewCell(frame: cellFrame)
        
        let textLabel = UILabel(frame: CGRectMake(10.0, 0.0, UIScreen.mainScreen().bounds.width - 20.0, 52.0 - 4.0))
        textLabel.textColor = UIColor.blackColor()
        textLabel.text = showsArray[indexPath.row]
        retCell.addSubview(textLabel)
        
        return retCell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 52.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 64.0
        }
        
        return 32.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UILabel(frame: CGRectMake(0, 0, self.tableView.frame.width - 20, 32.0))
        headerView.backgroundColor = UIColor.lightGrayColor()
        headerView.text = "TV Shows"
        headerView.textAlignment = .Center
        
        return headerView
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // Add action `More`
        let more = UITableViewRowAction(style: .Normal, title: "More") { action, index in
            print("more button tapped")
        }
        
        more.backgroundColor = UIColor.lightGrayColor()
        
        // Add action `Favorite`
        let favorite = UITableViewRowAction(style: .Normal, title: "Favorite") { action, index in
            print("favorite button tapped")
        }
        
        favorite.backgroundColor = UIColor.orangeColor()
        
        // Add action `Share`
        let share = UITableViewRowAction(style: .Normal, title: "Share") { action, index in
            print("share button tapped")
        }
        
        share.backgroundColor = UIColor.blueColor()
        
        return [share, favorite, more]
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // you need to implement this method too or you can't swipe to display the actions
    }
}

