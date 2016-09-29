//
//  ServiceViewController.swift
//  core-data-habrahabr-swift

import UIKit

class ServiceViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var infoTextField: UITextField!
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func save(sender: AnyObject) {
        if saveService() {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    var service: Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Reading object
        if let service = service {
            nameTextField.text = service.name
            infoTextField.text = service.info
        }
    }

    func saveService() -> Bool {
        
        // Validation of required fields
        if nameTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Validation error", message: "Input the name of the Service!", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            return false
        }
        
        // Creating object
        if service == nil {
            service = Service()
        }
        
        // Saving object
        if let service = service {
            service.name = nameTextField.text
            service.info = infoTextField.text
            CoreDataManager.instance.saveContext()
        }
        
        return true
    }
}

