//
//  ViewController.swift
//  CSBooksDemo
//
//  Created by msm72 on 8/1/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit
import Books

class ViewController: UIViewController {
    // MARK: - Properties
    var booksArray = [Book]()

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sharing NSUserDefaults
        self.saveUserDefaults()
        self.savePropertyList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Custom Functions
    func saveUserDefaults() {
        let sharedDefaults = NSUserDefaults(suiteName: "group.com.stfalcon.CSBooksDemo")
        sharedDefaults?.setObject("CSSS Books Extention", forKey: "ExtensionTitleKey")
        
        sharedDefaults?.synchronize()
    }
    
    func savePropertyList() {
        createBooks()
        
        if let filePath = SharedBooksManager.urlForSharedBooksArray() {
            NSKeyedArchiver.archiveRootObject(self.booksArray, toFile: filePath)
        }
    }
    
    func createBooks() {
        var book = Book(title: "The C++ Programming Language", author: "Kernighan & Ritchie")
        self.booksArray.append(book)
        
        book = Book(title: "The Art of Computer Programming", author: "Donald Knuth")
        self.booksArray.append(book)
        
        book = Book(title: "Introduction to Algorithms", author: "Cormen, Leiserson, Rivest, & Stein")
        self.booksArray.append(book)
    }
}

