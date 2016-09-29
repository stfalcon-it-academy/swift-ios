//
//  MasterViewController.swift
//  Project7
//
//  Created by Hudzilla on 14/09/2015.
//  Copyright © 2015 Paul Hudson. All rights reserved.
//

import UIKit
import SwiftyJSON

class MasterViewController: UITableViewController {
    // MARK: - Properties
	var objects = [[String: String]]()


    // MARK: - Class Functions
	override func viewDidLoad() {
		super.viewDidLoad()

		let urlString: String

		if navigationController?.tabBarItem.tag == 0 {
			urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
		} else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
		}

		if let url = NSURL(string: urlString) {
			if let data = try? NSData(contentsOfURL: url, options: []) {
				let json = JSON(data: data)

				if json["metadata"]["responseInfo"]["status"].intValue == 200 {
					parseJSON(json)
				} else {
					showError()
				}
			} else {
				showError()
			}
		} else {
			showError()
		}
	}

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Custom Functions
	func showError() {
		let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .Alert)
		ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
		
        presentViewController(ac, animated: true, completion: nil)
	}

	func parseJSON(json: JSON) {
		for result in json["results"].arrayValue {
			let title = result["title"].stringValue
			let body = result["body"].stringValue
			let sigs = result["signatureCount"].stringValue
			let obj = ["title": title, "body": body, "sigs": sigs]
			
            objects.append(obj)
		}

		tableView.reloadData()
	}


	// MARK: - Segues
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "showDetail" {
		    if let indexPath = self.tableView.indexPathForSelectedRow {
		        let object = objects[indexPath.row]
		        let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
		        controller.detailItem = object
		        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
		        controller.navigationItem.leftItemsSupplementBackButton = true
		    }
		}
	}
}


// MARK: - UITableViewDataSource
extension MasterViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return objects.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

		let object = objects[indexPath.row]
		cell.textLabel!.text = object["title"]
		cell.detailTextLabel!.text = object["body"]
		
        return cell
	}
}

