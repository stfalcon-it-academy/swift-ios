//
//  ViewController.swift
//  Maps
//
//  Created by Timothy Rodney Nugent on 25/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var mapView: MKMapView!
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegates
        mapView.delegate = self
        
        // Set map region
        let center = CLLocationCoordinate2DMake(-37.813611, 144.963056)
        let span = MKCoordinateSpanMake(0.2, 0.2)
        mapView.region = MKCoordinateRegionMake(center, span)

        // Creating an new annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "Melbourne"
        annotation.subtitle = "Victoria"
        mapView.addAnnotation(annotation);

        // Creating and adding a new circle overlay to the map
        let overlay = MKCircle(centerCoordinate: center, radius: 5000)
        mapView.addOverlay(overlay)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


// MARK: - MKMapViewDelegate
extension ViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay)

        if (overlay.isKindOfClass(MKCircle)) {
            circleRenderer.strokeColor = UIColor.blueColor()
            circleRenderer.lineWidth = 0
            circleRenderer.fillColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 0.5)
        }
        
        return circleRenderer
    }
}

