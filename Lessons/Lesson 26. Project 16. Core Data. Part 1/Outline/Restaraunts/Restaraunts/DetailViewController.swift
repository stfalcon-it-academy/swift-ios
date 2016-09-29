//
//  detailViewController.swift
//  Restaraunts
//
//  Created by Игорь on 27.11.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var tableView:UITableView!
    
    var restaurant: Restaurant!
    var restaurantImage = ""
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Дополнительные действия после загрузки view
        restaurantImageView.image = UIImage(data: restaurant.image!)
        
        // Сменить цвет TableView
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        // Убрать разделители пустых ячеек
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        // Сменить цвет разделителей
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        // Сменить title в navigationBar
        title = restaurant.name
        
        // Самомасштабирование
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Послать рейтинг ресторану ***
        if let rating = restaurant.rating where rating != "" {
            rateButton.setImage(UIImage(named: restaurant.rating!), forState: UIControlState.Normal)
        }
        
        // Delegates
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    @IBAction func close(segue: UIStoryboardSegue) {
        if let retingVC = segue.sourceViewController as? RateViewController {
            if let rating = retingVC.rating {
                restaurant.rating = rating //***
                rateButton.setImage(UIImage(named: rating), forState: .Normal)
            }
        }
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            let destinationViewController = segue.destinationViewController as! MapViewController
            destinationViewController.restaurant = restaurant
        }
    }
}


// MARK: - UITableViewDataSource
extension DetailViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RestaurantDetailCell
        
        // Настройка ячейки
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        
        case 3:
            cell.fieldLabel.text = "Phone"
            cell.valueLabel.text = restaurant.phoneNumber
        
        case 4:
            cell.fieldLabel.text = "Been here"
            if let isVisited = restaurant.isVisited?.boolValue {
                cell.valueLabel.text = isVisited ? "Yes" : "No"
            }
        
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
}


// MARK: - UITableViewDelegate
extension DetailViewController: UITableViewDelegate {}

