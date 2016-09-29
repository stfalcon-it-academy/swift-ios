//
//  ViewController.swift
//  Demo25-UISearchBar
//
//  Created by Prashant on 19/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // outlet - search bar
    @IBOutlet var mySearchBar: UISearchBar!

    // outlet - table view
    @IBOutlet var myTableView: UITableView!
    
    // array of fruit list
    var fruitList: [String] = [String]()
    var fruitListSearching: [String] = [String]()
    
    // search in progress or not
    var isSearching : Bool = false
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // fill up data
        self.fruitList  = [
            "Apple", "Apricot", "Avocado",
            "Banana", "Blueberry",
            "Coconut", "Custard Apple",
            "Dates", "Durian",
            "Fig",
            "Gooseberry", "Grapes", "Guava",
            "Jackfruit",
            "Lemon", "Lime", "Longan", "Lychee",
            "Mango",
            "Orange",
            "Papaya", "Pear", "Pineapple", "Pomogranate",
            "Raspberry",
            "Strawberry",
            "Watermelon"
        ]
        
        // set table view delegate
        myTableView.dataSource = self
        myTableView.delegate = self
        
        // set search bar delegate
        mySearchBar.delegate = self
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
        if isSearching == true {
            return fruitListSearching.count
        } else {
            return fruitList.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        if isSearching == true {
            cell.textLabel?.text = fruitListSearching[indexPath.row]
        } else {
            cell.textLabel?.text = fruitList[indexPath.row]
        }
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}

    
// MARK: - UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if self.mySearchBar.text!.isEmpty {
            // set searching false
            self.isSearching = false
            
            // reload table view
            self.myTableView.reloadData()
        } else {
            // set searghing true
            self.isSearching = true
            
            // empty searching array
            self.fruitListSearching.removeAll(keepCapacity: false)
            
            // find matching item and add it to the searcing array
            for i in 0..<self.fruitList.count {
                let listItem : String = self.fruitList[i]
                
                if listItem.lowercaseString.rangeOfString(self.mySearchBar.text!.lowercaseString) != nil {
                    self.fruitListSearching.append(listItem)
                }
            }
            
            self.myTableView.reloadData()
        }
    }
    
    // hide kwyboard when search button clicked
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.mySearchBar.resignFirstResponder()
    }
    
    // hide keyboard when cancel button clicked
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.mySearchBar.text = ""
        self.mySearchBar.resignFirstResponder()
        
        self.myTableView.reloadData()
    }
}

