//
//  ViewController.swift
//  Where
//
//  Created by Allen on 16/1/12.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Actions
    @IBAction func myLocationButtonDidTouch(sender: AnyObject) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}


// MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
      locationLabel.text = "Error while updating location " + error.localizedDescription
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
               self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0] 
                self.displayLocationInfo(pm)
            } else {
               self.locationLabel.text = "Problem with the data received from geocoder"
            }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            locationLabel.text = locality! +  postalCode! +  administrativeArea! +  country!
        }
    }
}

