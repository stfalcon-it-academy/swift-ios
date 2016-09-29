//
//  TableViewController.swift
//  ContainerViewDemo
//
//  Created by msm72 on 6/17/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    // MARK: - Properties
    let dataSource = Array(count: 50, repeatedValue: "Hello, container view!!!")
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UITableViewDataSource
extension TableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1) + ". " + dataSource[indexPath.row]

        return cell
    }
}
