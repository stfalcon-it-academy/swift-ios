//
//  MainViewController.swift
//  CustomFont
//
//  Created by Allen on 16/1/7.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    var fontRowIndex = 0
 
    @IBOutlet weak var changeFontButton: CustomButton!
    @IBOutlet weak var fontTableView: UITableView!
    
    
    // MARK: - Actions
    @IBAction func changeFontDidTouch(sender: CustomButton) {
        fontRowIndex = (fontRowIndex + 1) % 3
        
        fontTableView.reloadData()
    }
  

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegates
        fontTableView.dataSource = self
        fontTableView.delegate = self
        
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family){
                print(font)
            }
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}


// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}


// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath)
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size:16)
        
        return cell
    }
}

