//
//  MapViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 30/8/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var mapView: MKMapView!
    
    var restaurant: Restaurant!

    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
       
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in
            if error != nil {
                print(error)
                
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
            
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
            
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
            
                    // Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
        
        // Map customization
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        
        // Set the MKMapViewDelegate
        mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        // Check user location
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        // Reuse the annotation if possible
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 100, 98))
        leftIconView.image = UIImage(named: restaurant.image)
        leftIconView.layer.cornerRadius = 8
        leftIconView.layer.masksToBounds = true
        annotationView?.leftCalloutAccessoryView = leftIconView
    
        // Pin color customization
        annotationView?.pinTintColor = UIColor.magentaColor()
    
        return annotationView
    }
}
