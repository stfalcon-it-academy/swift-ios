//
//  RouteTableViewController.swift
//  MapKitDirectionDemo
//
//  Created by Simon Ng on 6/10/2015.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class RouteTableViewController: UITableViewController {
    // MARK: - Properties
    var routeSteps = [MKRouteStep]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.estimatedRowHeight = 51.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UITableViewDataSource
extension RouteTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routeSteps.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = routeSteps[indexPath.row].instructions
        cell.detailTextLabel?.text = String(Int(routeSteps[indexPath.row].distance)) + " meters"

        return cell
    }
}


// MARK: - UITableViewDelegate
extension RouteTableViewController {}