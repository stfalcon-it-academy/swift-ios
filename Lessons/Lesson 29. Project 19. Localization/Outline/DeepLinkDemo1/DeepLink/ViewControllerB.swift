//
//  ViewControllerB.swift
//  DeepLink
//
//  Created by Brian Coleman on 2015-07-12.
//  Copyright (c) 2015 Brian Coleman. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellowColor()
        let label: UILabel = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        label.text = "Article B"
        label.textAlignment = .Center

        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

