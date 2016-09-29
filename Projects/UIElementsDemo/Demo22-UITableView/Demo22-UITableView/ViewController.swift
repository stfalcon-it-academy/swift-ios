//
//  ViewController.swift
//  Demo22-UITableView
//
//  Created by Prashant on 07/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    var fruits = [String]()
    var vegetables = [String]()
    var others  = [String]()

    @IBOutlet var myTableView: UITableView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // set data within item list
        fruits = ["Apple", "Orange", "Pineapple", "Grapes", "Strawberry"]
        vegetables = ["Potato", "Cabbage", "Lettuce", "Tomato"]
        others = ["Bread", "Butter", "Paneer", "Cheese", "Milk", "Wheat Floor", "Multigrain Bread", "Custard Powder", "Spice", "Turmeric", "Clove" ]
        
        // set table view delegate and data source
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Transition
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueDetails" {
            // find indexpath for selected row
            let selectedIndexPath = self.myTableView.indexPathForSelectedRow
            
            // deselet row
            myTableView.deselectRowAtIndexPath(selectedIndexPath!, animated: true)
            
            // set title
            var selectedTitle = ""
           
            if selectedIndexPath!.section == 0 {
                selectedTitle = fruits[selectedIndexPath!.row]
            } else if selectedIndexPath!.section == 1 {
                selectedTitle = vegetables[selectedIndexPath!.row]
            } else if selectedIndexPath!.section == 2 {
                selectedTitle = others[selectedIndexPath!.row]
            }
            
            // create object for destination view controller
            let destVc = segue.destinationViewController as! DetailsViewController
            
            // set value for selected item name within destination view controller
            destVc.selectedItemName = selectedTitle
        }
    }
}



// Mark: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    // set number of sections within table view
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    // set number for rows for each setion
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return fruits.count
        }
        
        if section == 1 {
            return vegetables.count
        }
        
        if section == 2 {
            return others.count
        }
        
        return 0
    }
    
    // set header title for each section
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Fruits"

        case 1:
            return "Vegetables"
            
        case 2:
            return "Others"
            
        default:
            return "Default Title"
        }
    }
    
    // set cell content for each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // deque reusable cell
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        
        // set item title
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = fruits[indexPath.row]
            
        case 1:
            cell.textLabel?.text = vegetables[indexPath.row]
            
        case 2:
            cell.textLabel?.text = others[indexPath.row]
            
        default:
            break
        }
        
        // return cell
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    // go to details screen when clicked on a table row.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("segueDetails", sender: self)
    }
}

