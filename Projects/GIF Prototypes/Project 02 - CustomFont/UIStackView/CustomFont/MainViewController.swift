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
    @IBOutlet var labelsCollection: [UILabel]!

    
    // MARK: - Actions
    @IBAction func changeFontDidTouch(sender: CustomButton) {
        fontRowIndex = (fontRowIndex + 1) % 3
        
        for label in labelsCollection {
            label.font = UIFont(name: fontNames[fontRowIndex], size: 16)
        }
    }
  

    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example: how get all fonts
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family){
                print(font)
            }
        }
        
        // Set start fonts
        for (index, label) in labelsCollection.enumerate() {
            label.text = data[index]
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
