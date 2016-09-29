//
//  ViewController.swift
//  TableViewTest
//
//  Created by Abhishek Mishra on 07/05/2015.
//  Copyright (c) 2015 asm technology ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // Set array of sections
    var continents: Array<String> = ["Asia", "North America", "Europe", "Australia"]
    
    // Set arrays of rows in sections
    var citiesInAsia = ["Bangkok", "New Delhi", "Singapore", "Tokyo"]
    var citiesInNorthAmerica = ["San Francisco","Cupertino"]
    var citiesInEurope = ["London", "Paris", "Rome", "Athens"]
    var citiesInAustralia = ["Sydney", "Melbourne", "Cairns"]
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    // Return number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return continents.count;
    }
    
    // Return title of section
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return continents[section];
    }
    
    // Return number of rows in section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return citiesInAsia.count
            
        case 1:
            return citiesInNorthAmerica.count
            
        case 2:
            return citiesInEurope.count
            
        case 3:
            return citiesInAustralia.count
            
        default:
            break
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = citiesInAsia[indexPath.row]
            
        case 1:
            cell.textLabel?.text = citiesInNorthAmerica[indexPath.row]

        case 2:
            cell.textLabel?.text = citiesInEurope[indexPath.row]

        case 3:
            cell.textLabel?.text = citiesInAustralia[indexPath.row]

        default:
            break
        }
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate { }

