/*
 * Copyright (c) 2015 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import MapKit
import CoreLocation
import RealmSwift
import RealmSwiftSFRestaurantData

class MapViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var mapView: MKMapView!
    
    let kDistanceMeters: CLLocationDistance = 500
    var locationManager = CLLocationManager()
    var userLocated = false
    var lastAnnotation: MKAnnotation!
    var specimens = try! Realm().objects(Specimen)
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Map"
        
        // Delegates
        mapView.delegate = self
        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else {
            locationManager.startUpdatingLocation()
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL?.path!)
        
        populateMap()
    }
    
    
    // MARK: - Actions & Segues
    @IBAction func centerToUserLocationTapped(sender: AnyObject) {
        centerToUsersLocation()
    }
    
    @IBAction func addNewEntryTapped(sender: AnyObject) {
        addNewPin()
    }
    
    @IBAction func unwindFromAddNewEntry(segue: UIStoryboardSegue) {
        let addNewEntryController = segue.sourceViewController as! AddNewEntryController
        let addedSpecimen = addNewEntryController.specimen
        let addedSpecimenCoordinate = CLLocationCoordinate2D(latitude: addedSpecimen.latitude, longitude: addedSpecimen.longitude)
        
        if let lastAnnotation = lastAnnotation {
            mapView.removeAnnotation(lastAnnotation)
        } else {
            for annotation in mapView.annotations {
                if let currentAnnotation = annotation as? SpecimenAnnotation {
                    if currentAnnotation.coordinate.latitude == addedSpecimenCoordinate.latitude && currentAnnotation.coordinate.longitude == addedSpecimenCoordinate.longitude {
                        mapView.removeAnnotation(currentAnnotation)
                       
                        break
                    }
                }
            }
        }
        
        let annotation = SpecimenAnnotation(coordinate: addedSpecimenCoordinate, title: addedSpecimen.name, subtitle: addedSpecimen.category.name, specimen: addedSpecimen)
        
        mapView.addAnnotation(annotation)
        lastAnnotation = nil;
    }
    
    
    // MARK: - Transition
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "NewEntry") {
            let controller = segue.destinationViewController as! AddNewEntryController
            let specimenAnnotation = sender as! SpecimenAnnotation
            controller.selectedAnnotation = specimenAnnotation
        }
    }
    
    
    // MARK: - Custom Functions
    func centerToUsersLocation() {
        let center = mapView.userLocation.coordinate
        let zoomRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(center, kDistanceMeters, kDistanceMeters)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    func addNewPin() {
        if lastAnnotation != nil {
            let alertController = UIAlertController(title: "Annotation already dropped", message: "There is an annotation on screen. Try dragging it if you want to change its location!", preferredStyle: .Alert)
            
            let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive) { alert in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            }
            
            alertController.addAction(alertAction)
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            let specimen = SpecimenAnnotation(coordinate: mapView.centerCoordinate, title: "Empty", subtitle: "Uncategorized")
            
            mapView.addAnnotation(specimen)
            lastAnnotation = specimen
        }
    }
    
    func populateMap() {
        // 1: delete all old annotations
        mapView.removeAnnotations(mapView.annotations)
        
        // 2: create results array with Specimen objects
        specimens = try! Realm().objects(Specimen)
        
        // Create annotations for each one
        for specimen in specimens {
            // 3: create annotations from properties of specimen
            let coord = CLLocationCoordinate2D(latitude: specimen.latitude, longitude: specimen.longitude);
            let specimenAnnotation = SpecimenAnnotation(coordinate: coord, title: specimen.name, subtitle: specimen.category.name, specimen: specimen)
            
            // 4: add annotation on map
            mapView.addAnnotation(specimenAnnotation)
        }
    }
}


// MARK: - CLLocationManager Delegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        status != .NotDetermined ? mapView.showsUserLocation = true : print("Authorization to use location data denied")
    }
}


// MARK: - MKMapview Delegate
extension MapViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        guard let subtitle = annotation.subtitle! else { return nil }
        
        if (annotation is SpecimenAnnotation) {
            if let annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(subtitle) {
                return annotationView
            } else {
                let currentAnnotation = annotation as! SpecimenAnnotation
                let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: subtitle)
                
                switch subtitle {
                case "Uncategorized":
                    annotationView.image = UIImage(named: "IconUncategorized")
                
                case "Arachnids":
                    annotationView.image = UIImage(named: "IconArachnid")
                
                case "Birds":
                    annotationView.image = UIImage(named: "IconBird")
                
                case "Mammals":
                    annotationView.image = UIImage(named: "IconMammal")
                
                case "Flora":
                    annotationView.image = UIImage(named: "IconFlora")
                
                case "Reptiles":
                    annotationView.image = UIImage(named: "IconReptile")
                
                default:
                    annotationView.image = UIImage(named: "IconUncategorized")
                }
                
                annotationView.enabled = true
                annotationView.canShowCallout = true
               
                let detailDisclosure = UIButton(type: UIButtonType.DetailDisclosure)
                annotationView.rightCalloutAccessoryView = detailDisclosure
                
                if currentAnnotation.title == "Empty" {
                    annotationView.draggable = true
                }
                
                return annotationView
            }
        }
        
        return nil
    }
    
    func mapView(mapView: MKMapView, didAddAnnotationViews views: [MKAnnotationView]) {
        for annotationView in views {
            if (annotationView.annotation is SpecimenAnnotation) {
                annotationView.transform = CGAffineTransformMakeTranslation(0, -500)
                UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveLinear, animations: {
                    annotationView.transform = CGAffineTransformMakeTranslation(0, 0)
                    }, completion: nil)
            }
        }
    }
    
    func mapView(mapView: MKMapView, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let specimenAnnotation =  annotationView.annotation as? SpecimenAnnotation {
            performSegueWithIdentifier("NewEntry", sender: specimenAnnotation)
        }
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, didChangeDragState newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        if newState == .Ending {
            view.dragState = .None
        }
    }
}
