//
//  FirstViewController.swift
//  TabbedApplicationTest
//
//  Created by Abhishek Mishra on 08/10/2015.
//  Copyright © 2015 Abhishek Mishra. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!

    let continents = ["Asia", "North America", "Europe", "Australia"]
    let citiesInAsia = ["Bangkok", "New Delhi", "Singapore", "Tokyo"]
    let citiesInNorthAmerica = ["San Francisco","Cupertino"]
    let citiesInEurope = ["London", "Paris", "Rome", "Athens"]
    let citiesInAustralia = ["Sydney", "Melbourne", "Cairns"]
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - UITableViewDataSource
extension FirstViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return continents[section];
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return continents.count
    }
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("prototypeCell1", forIndexPath: indexPath)
        
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

