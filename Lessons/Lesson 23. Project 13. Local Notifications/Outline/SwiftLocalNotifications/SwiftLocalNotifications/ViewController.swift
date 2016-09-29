//
//  ViewController.swift
//  SwiftLocalNotifications
//
//  Created by msm72 on 7/8/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    // MARK: - Properties
    var currentLocation: CLLocation? = nil
    let locationManager = CLLocationManager()
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        //pushLocalNotification()
        
        // Location Notification
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.authorizationStatus() != .AuthorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        } else {
            locationManager.startUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func handlerLocationButtonTap(sender: UIButton) {
        print(#function)
        
        let localNotification = UILocalNotification()
        
        localNotification.alertAction = "Testing location notification"
        localNotification.alertBody = "Location local notification is working"
//        localNotification.fireDate = NSDate(timeIntervalSinceNow: 7)
        localNotification.soundName = "applause_whistle.mp3"
        localNotification.regionTriggersOnce = true
        localNotification.region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 35.70206910, longitude: 139.77532690), radius: 5000, identifier: "Location1")

        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    
    // MARK: - Custom Functions
    func pushLocalNotification() {
        print(#function)
        
        let localNotification = UILocalNotification()
        
        localNotification.alertAction = "Testing notifications on iOS9"
        localNotification.alertBody = "Local notifications are working"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.category = "invite"
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
}


// MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        var shouldAllow = false
        
        switch status {
        case .AuthorizedWhenInUse:
            shouldAllow = true
            
        case .AuthorizedAlways:
            shouldAllow = true
            
        default:
            shouldAllow = false
        }
        
        if shouldAllow == true {
            manager.startUpdatingLocation()
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        
        for newLocation in locationArray {
            // lat/lon values should only be considered if
            // horizontalAccuracy is not negative.
            if newLocation.horizontalAccuracy >= 0 {
                let currentLatitude = newLocation.coordinate.latitude
                let currentLongitude = newLocation.coordinate.longitude
                
                currentLocation = CLLocation(latitude: currentLatitude, longitude: currentLongitude)
                
                print(#function + ": currentLocation = \(currentLocation)")
            }
        }
    }
}
