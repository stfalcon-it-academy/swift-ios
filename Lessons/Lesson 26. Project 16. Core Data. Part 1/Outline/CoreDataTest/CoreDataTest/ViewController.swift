//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Abhishek Mishra on 08/06/2015.
//  Copyright (c) 2015 asm technology ltd. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var postCodeField: UITextField!
    @IBOutlet weak var tableOfContacts: UITableView!
    
    var listOfContacts:Array<ContactData>? = nil
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchExistingContacts()
        
        // Delegates
        tableOfContacts.dataSource = self
        tableOfContacts.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Actions
    @IBAction func onAdd(sender: AnyObject) {
        nameField.resignFirstResponder()
        phoneNumberField.resignFirstResponder()
        postCodeField.resignFirstResponder()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let newCustomerName:String! = nameField.text
        let newCustomerPhoneNumber:String! = phoneNumberField.text
        let newCustomerPostcode:String! = postCodeField.text
        
        if newCustomerName.isEmpty && newCustomerPhoneNumber.isEmpty && newCustomerPostcode.isEmpty {
            return
        }
        
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("ContactData", inManagedObjectContext: appDelegate.managedObjectContext) as! ContactData
        newItem.customerName = newCustomerName
        newItem.phoneNumber = newCustomerPhoneNumber
        newItem.postCode = newCustomerPostcode
        
        do {
            try appDelegate.managedObjectContext.save()
        } catch {
            // handle error.
        }
        
        fetchExistingContacts()
        tableOfContacts.reloadData()
    }
    
    
    // MARK: - Custom Functions
    func fetchExistingContacts() {
        let fetchRequest = NSFetchRequest(entityName: "ContactData")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        do {
            self.listOfContacts = try
                appDelegate.managedObjectContext.executeFetchRequest(fetchRequest)
                as? [ContactData]
        } catch {
            // handle errors here.
        }
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfContacts!.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactDataTableViewCellIdentifier", forIndexPath: indexPath)
        let someContactData:ContactData! = listOfContacts![indexPath.row]
        
        cell.textLabel?.text = someContactData.customerName
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {}

