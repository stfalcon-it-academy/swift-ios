//
//  MapViewController.swift
//  MapKitDirectionDemo
//
//  Created by Simon Ng on 18/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var restaurant: Restaurant!
    
    let locationManager = CLLocationManager()
    var currentPlacemark: CLPlacemark?
    var currentAnnotation: MKPointAnnotation!
    
    var currentTransportType: MKDirectionsTransportType = .Any
    var currentRoute: MKRoute?
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.hidden = true
        
        // Request for a user's authorization for location services
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        
        if status == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        
        // Delegates
        mapView.delegate = self
        
        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(restaurant.address, completionHandler: { placemarks, error in
            if error != nil {
                print(error)
                
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                self.currentPlacemark = placemark
                
                // Add annotation
                self.currentAnnotation = MKPointAnnotation()
                self.currentAnnotation.title = self.restaurant.name
                self.currentAnnotation.subtitle = self.restaurant.category
                
                if let location = placemark.location {
                    self.currentAnnotation.coordinate = location.coordinate
                    
                    // Display the annotation
                    self.mapView.showAnnotations([self.currentAnnotation], animated: true)
                    self.mapView.selectAnnotation(self.currentAnnotation, animated: true)
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Actions
    @IBAction func showDirection(sender: AnyObject) {
        // Get the selected transport type
        switch segmentedControl.selectedSegmentIndex {
        case 0: currentTransportType = .Automobile
        case 1: currentTransportType = .Walking
        default: break
        }
        
        segmentedControl.hidden = false
        self.mapView.deselectAnnotation(currentAnnotation, animated: true)
        
        guard let restaurantPlacemark = currentPlacemark else {
            return
        }
        
        let directionRequest = MKDirectionsRequest()
        
        // Set the source of the route (user location)
        directionRequest.source = MKMapItem.mapItemForCurrentLocation()

        // Set the destination of the route (restaurant location)
        let destinationPlacemark = MKPlacemark(placemark: restaurantPlacemark)
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = currentTransportType
        
        // Calculate the direction
        let directions = MKDirections(request: directionRequest)
        
        directions.calculateDirectionsWithCompletionHandler { (routeResponse, routeError) -> Void in
            // Chaeck route & error
            guard let routeResponse = routeResponse else {
                if let routeError = routeError {
                    print("Error: \(routeError)")
                }
                
                return
            }
            
            let route = routeResponse.routes[0]
            self.currentRoute = route
            self.mapView.removeOverlays(self.mapView.overlays)
            
            // Add route lines to map
            self.mapView.addOverlay(route.polyline, level: .AboveRoads)

            // Create rect which contain all pins & set it visible in device screen
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            self.mapView.setVisibleMapRect(rect, edgePadding: UIEdgeInsetsMake(50, 50, 50, 50), animated: true)
        }
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showSteps" {
            let routeTableViewController = segue.destinationViewController as! RouteTableViewController
            
            if let steps = currentRoute?.steps {
                routeTableViewController.routeSteps = steps
            }
        }
    }
}


// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        // Reuse the annotation if possible
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 70, 50))
        leftIconView.image = UIImage(named: restaurant.image)!
        leftIconView.layer.cornerRadius = 8
        leftIconView.layer.masksToBounds = true
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        // Pin color customization
        if #available(iOS 9.0, *) {
            annotationView?.pinTintColor = UIColor.orangeColor()
        }
        
        annotationView?.rightCalloutAccessoryView = UIButton(type: UIButtonType.DetailDisclosure)
        
        return annotationView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard currentRoute != nil else {
            return
        }
        
        performSegueWithIdentifier("showSteps", sender: view)
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = (currentTransportType == .Automobile) ? UIColor.blueColor() : UIColor.orangeColor()
        renderer.lineWidth = 3.0
        
        return renderer
    }
}
