//
//  TableViewController.swift
//  SpellChecker
//
//  Created by Ivan Akulov on 28/02/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    // MARK: - Properties
    let wordVariations = ["магозин", "могозин", "магазин", "магазен"]
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Custom Functions
    func ifWordCorrect(word: String) -> Bool {
        let textChecker = UITextChecker()
        let checkRange = NSMakeRange(0, word.characters.count)
        let stringRange = textChecker.rangeOfMisspelledWordInString(word, range: checkRange, startingAt: 0, wrap: false, language: "ru")
        
        return stringRange.location == NSNotFound
    }
}


// MARK: - UITableViewDataSource
extension TableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in section
        return wordVariations.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = wordVariations[indexPath.row]
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension TableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if ifWordCorrect((cell.textLabel?.text)!) {
            cell.textLabel?.textColor = UIColor.greenColor()
        } else {
            cell.textLabel?.textColor = UIColor.redColor()
        }
        
        tableView.reloadData()
    }
}
