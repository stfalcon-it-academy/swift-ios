//
//  RowOfOrderViewController.swift
//  core-data-habrahabr-swift

import UIKit

class RowOfOrderViewController: UIViewController {

    var rowOfOrder: RowOfOrder?
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save(sender: AnyObject) {
        saveRow()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func choiceService(sender: AnyObject) {
        performSegueWithIdentifier("rowOfOrderToServices", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "rowOfOrderToServices" {
            let controller = segue.destinationViewController as! ServicesTableViewController
            controller.didSelect = {[unowned self] (service) in
                if let service = service {
                    self.rowOfOrder!.service = service
                    self.textFieldService.text = service.name
                }
            }
        }
    }
    
    @IBOutlet weak var textFieldService: UITextField!
    @IBOutlet weak var textFieldSum: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let rowOfOrder = rowOfOrder {
            textFieldService.text = rowOfOrder.service?.name
            textFieldSum.text = String(rowOfOrder.sum)
        } else {
            rowOfOrder = RowOfOrder()
        }
    }
    
    func saveRow() {
        if let rowOfOrder = rowOfOrder {
            rowOfOrder.sum = Float(textFieldSum.text!)!
            CoreDataManager.instance.saveContext()
        }
    }
}
