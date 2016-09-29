/*
 * Copyright (c) 2015 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import RealmSwift


class AddNewEntryController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    var selectedAnnotation: SpecimenAnnotation!
    var selectedCategory: Category!
    var specimen: Specimen!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let specimen = specimen {
            title = "Edit \(specimen.name)"
            fillTextFields()
        } else {
            title = "Add New Specimen"
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if validateFields() {
            if specimen != nil {
                updateSpecimen()
            } else {
                addNewSpecimen()
            }
            
            return true
        } else {
            return false
        }
    }

    
    // MARK: - Actions
    @IBAction func unwindFromCategories(segue: UIStoryboardSegue) {
        if segue.identifier == "CategorySelectedSegue" {
            let categoriesController = segue.sourceViewController as! CategoriesTableViewController
            selectedCategory = categoriesController.selectedCategory
            categoryTextField.text = selectedCategory.name
        }
    }
    

    // MARK: - Custom Functions
    func validateFields() -> Bool {
        if nameTextField.text!.isEmpty || descriptionTextField.text!.isEmpty || selectedCategory == nil {
            let alertController = UIAlertController(title: "Validation Error", message: "All fields must be filled", preferredStyle: .Alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .Destructive) { alert in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            }
            
            alertController.addAction(alertAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
            return false
            
        } else {
            return true
        }
    }
    
    func fillTextFields() {
        nameTextField.text = specimen.name
        categoryTextField.text = specimen.category.name
        descriptionTextField.text = specimen.specimenDescription
        
        selectedCategory = specimen.category
    }
    
    func updateSpecimen() {
        let realm = try! Realm()
        
        try! realm.write {
            self.specimen.name = self.nameTextField.text!
            self.specimen.category = self.selectedCategory
            self.specimen.specimenDescription = self.descriptionTextField.text
        }
    }
    
    func addNewSpecimen() {
        // 1: cretae new Realm
        let realm = try! Realm()
        
        // 2: start transaction to Realm
        try! realm.write {
            // 3: create new Specimen
            let newSpecimen = Specimen()
            
            // 4: set Specimen properties
            newSpecimen.name = self.nameTextField.text!
            newSpecimen.category = self.selectedCategory
            newSpecimen.specimenDescription = self.descriptionTextField.text
            newSpecimen.latitude = self.selectedAnnotation.coordinate.latitude
            newSpecimen.longitude = self.selectedAnnotation.coordinate.longitude
            
            // 5: add new Specimen to Realm
            realm.add(newSpecimen)
            
            // 6: set new Specimen value
            self.specimen = newSpecimen
        }
    }
}


// MARK: - UITextFieldDelegate
extension AddNewEntryController: UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField) {
        performSegueWithIdentifier("Categories", sender: self)
    }
}

