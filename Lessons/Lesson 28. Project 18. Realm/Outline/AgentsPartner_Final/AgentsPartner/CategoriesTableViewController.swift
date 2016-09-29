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


class CategoriesTableViewController: UITableViewController {
    // MARK: - Properties
    let realm = try! Realm()
    
    lazy var categories: Results<Category> = {
        self.realm.objects(Category)
    }()
    
    var selectedCategory: Category!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateDefaultCategories()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .Default
    }
    
    
    // MARK: - Custom Functions
    func populateDefaultCategories() {
        // 1: check categories count
        if categories.count == 0 {
            // 2: start transaction to Realm
            try! realm.write() {
                // 3: create array with default categories
                let defaultCategories = ["Birds", "Mammals", "Flora", "Reptiles", "Arachnids" ]
                
                // 4: iterate through the array
                for category in defaultCategories {
                    // create new Category
                    let newCategory = Category()
                    
                    // set property name new value
                    newCategory.name = category
               
                    // add new Category to Realm
                    self.realm.add(newCategory)
                }
            }
            
            // 5: set new categories from Realm
            categories = realm.objects(Category)
        }
    }
}


// MARK: - UITableViewDataSource
extension CategoriesTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath)
        
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension CategoriesTableViewController {
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath {
        // used in AddNewEntryController: 
        selectedCategory = categories[indexPath.row]
        
        return indexPath
    }
}
