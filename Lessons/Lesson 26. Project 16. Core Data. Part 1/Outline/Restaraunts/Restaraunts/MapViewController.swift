//
//  MapViewController.swift
//  Restaraunts
//
//  Created by Игорь on 07.12.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var mapView: MKMapView!
    var restaurant: Restaurant!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Delegate
        mapView.delegate = self
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in
            if error != nil {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        var annotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let lefIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        lefIconView.image = UIImage(data: restaurant.image!)
        annotationView?.leftCalloutAccessoryView = lefIconView
        
        return annotationView
    }
}

