//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 19/8/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var restaurantImageView:UIImageView!
    @IBOutlet var restaurantNameLabel:UILabel!
    @IBOutlet var restaurantTypeLabel:UILabel!
    @IBOutlet var restaurantLocationLabel:UILabel!
    
    var restaurantImage = ""
    var restaurantName = ""
    var restaurantType = ""
    var restaurantLocation = ""

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: restaurantImage)
        restaurantNameLabel.text = restaurantName
        restaurantTypeLabel.text = restaurantType
        restaurantLocationLabel.text = restaurantLocation
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
