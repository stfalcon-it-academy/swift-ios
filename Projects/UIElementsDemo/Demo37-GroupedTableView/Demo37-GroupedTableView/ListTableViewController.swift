//
//  ListTableViewController.swift
//  Demo37-GroupedTableView
//
//  Created by Prashant on 23/10/15.
//  Copyright © 2015 PrashantKumar Mangukiya. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    // MARK: - Properties
    // array of fruit list
    var fruitList: [String] = Array()
    
    // array of fruit list that converted into Group (i.e. section)
    var fruitListGrouped = NSDictionary() as! [String : [String]]
    
    // array of section titles
    var sectionTitleList = [String]()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create data for the list
        self.createData()
        
        // split data into section
        self.splitDataInToSection()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Custom Functions
    private func createData() {
        // fill up data
        self.fruitList  = [
            "Strawberry",
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
            "Watermelon"
        ]
        
        // sort the array  (Important)
        fruitList = fruitList.sort()
    }
    
    
    private func splitDataInToSection() {
        // set section title "" at initial
        var sectionTitle = ""
        
        // iterate all records from array
        for i in 0..<self.fruitList.count {
            // get current record
            let currentRecord = self.fruitList[i]
            
            // find first character from current record
            let firstChar = currentRecord[currentRecord.startIndex]
            
            // convert first character into string
            let firstCharString = "\(firstChar)"
            
            // if first character not match with past section title then create new section
            if firstCharString != sectionTitle {
                // set new title for section
                sectionTitle = firstCharString
                
                // add new section having key as section title and value as empty array of string
                fruitListGrouped[sectionTitle] = [String]()
                
                // append title within section title list
                sectionTitleList.append(sectionTitle)
            }
            
            // add record to the section
            fruitListGrouped[firstCharString]?.append(currentRecord)
        }
        
    }
}


// MARK: - UITableViewDataSource
extension ListTableViewController {
    // return the number of sections
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fruitListGrouped.count
    }
    
    // return the number of rows
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // find section title
        let sectionTitle = sectionTitleList[section]
        
        // find fruit list for given section title
        let fruits = fruitListGrouped[sectionTitle]
        
        // return count for fruits
        return fruits!.count
    }
    
    // return cell for given row
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // collect reusable cell
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        // find section title
        let sectionTitle = sectionTitleList[indexPath.section]
        
        // find fruit list for given section title
        let fruits = fruitListGrouped[sectionTitle]
        
        // find fruit name based on the row within section
        cell.textLabel?.text = fruits![indexPath.row]
        
        // return cell
        return cell
    }
    
    // return section header title
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTitleList[section]
    }
    
    
    // return title list for section index
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return self.sectionTitleList
    }
    // return section for given section index title
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return index
    }
}
    
