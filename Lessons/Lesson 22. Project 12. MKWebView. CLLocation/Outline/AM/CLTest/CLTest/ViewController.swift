//
//  ViewController.swift
//  CLTest
//
//  Created by Abhishek Mishra on 23/06/2015.
//  Copyright © 2015 asm technology ltd. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var latitudeValue: UILabel!
    @IBOutlet weak var longitudeValue: UILabel!
    @IBOutlet weak var distanceValue: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    var locationManager: CLLocationManager! //? = nil
    var lastLocation: CLLocation? = nil
    var isReceivingLocationUpdates = false
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager!.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        // Delegates
        locationManager!.delegate = self
        
        lastLocation = CLLocation(latitude: 51.5001524, longitude: -0.1262362)
        toggleButton.titleLabel!.text = "Start location updates"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Actions
    @IBAction func onButtonPressed(sender: AnyObject) {
        if isReceivingLocationUpdates == false {
            if CLLocationManager.authorizationStatus() != .AuthorizedWhenInUse {
                locationManager!.requestWhenInUseAuthorization()
            } else {
                isReceivingLocationUpdates = true
                toggleButton.titleLabel!.text = "Stop location updates"
                
                locationManager!.startUpdatingLocation()
            }
        } else {
            isReceivingLocationUpdates = false
            
            toggleButton.titleLabel!.text = "Start location updates"
            
            locationManager!.stopUpdatingLocation()
        }
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
            isReceivingLocationUpdates = true
            toggleButton.titleLabel!.text = "Stop location updates"
            
            manager.startUpdatingLocation()
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
       
        for newLocation in locationArray {
            // lat/lon values should only be considered if
            // horizontalAccuracy is not negative.
            if newLocation.horizontalAccuracy >= 0 {
                let currentLatitude: CLLocationDegrees = newLocation.coordinate.latitude;
                let currentLongitude: CLLocationDegrees = newLocation.coordinate.longitude;
                let distanceTravelled = newLocation.distanceFromLocation(lastLocation!)
                
                latitudeValue.text = "\(currentLatitude)"
                longitudeValue.text = "\(currentLongitude)"
                distanceValue.text = "\(distanceTravelled)"
                
                lastLocation = newLocation as? CLLocation
            }
        }
    }
}

