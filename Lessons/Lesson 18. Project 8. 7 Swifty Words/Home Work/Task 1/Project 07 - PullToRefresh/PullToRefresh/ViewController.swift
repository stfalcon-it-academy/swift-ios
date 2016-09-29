//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Allen on 16/1/13.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    let cellIdentifer = "NewCellIdentifier"

    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    var tableViewController = UITableViewController(style: .Plain)
    
    var refreshControl = UIRefreshControl()
    var navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 375, height: 64))

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiData = favoriteEmoji
        let emojiTableView = tableViewController.tableView
        
        emojiTableView.frame.origin.y = 64
        emojiTableView.backgroundColor = UIColor(red: 0.092, green: 0.096, blue: 0.116, alpha: 1)
        emojiTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        emojiTableView.dataSource = self
        emojiTableView.delegate = self
        
        tableViewController.refreshControl = self.refreshControl
        refreshControl.addTarget(self, action: #selector(didRoadEmoji), forControlEvents: .ValueChanged)
        
        refreshControl.backgroundColor = UIColor(red: 0.113, green: 0.113, blue: 0.145, alpha: 1)
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())", attributes: attributes)
        refreshControl.tintColor = UIColor.whiteColor()
        
        self.navBar.barStyle = .BlackTranslucent
        self.navBar.frame.size.width = CGRectGetWidth(self.view.frame)
        
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        emojiTableView.tableFooterView = UIView(frame: CGRectZero)
        emojiTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.view.addSubview(emojiTableView)
        self.view.addSubview(navBar)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        let newItem = UINavigationItem.init(title: "emoji")
        self.navBar.setItems([newItem], animated: false)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    // MARK: - Custom Functions
    func didRoadEmoji() {
        self.emojiData = newFavoriteEmoji
        
        sleep(2)
        tableViewController.tableView.reloadData()
        refreshControl.endRefreshing()
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer)! as UITableViewCell
        
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.Center
        cell.textLabel!.font = UIFont.systemFontOfSize(50)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        return cell
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}

