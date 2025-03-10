//
//  ViewController.swift
//  maps uikit
//
//  Created by Borges on 27/02/25.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let london = Capital(
            title: "London",
            coordinate: CLLocationCoordinate2D(
                latitude: 51.507222,
                longitude: -0.1275
            ),
            info: "Home of the 2012 summe olympics"
        )
        
        let oslo = Capital(
            title: "Oslo",
            coordinate: CLLocationCoordinate2D(
                latitude: 59.95,
                longitude: 10.75
            ),
            info: "Founded over a thousand years ago"
        )
        
        let paris = Capital(
            title: "Paris",
            coordinate: CLLocationCoordinate2D(
                latitude: 48.8567,
                longitude: 2.3508
            ),
            info: "Often called the City of Light"
        )
        
        let rome = Capital(
            title: "Rome",
            coordinate: CLLocationCoordinate2D(
                latitude: 41.9,
                longitude: 12.5
            ),
            info: "Has a whole country inside it"
        )
        
        let washington = Capital(
            title: "Washington DC",
            coordinate: CLLocationCoordinate2D(
                latitude: 38.89111,
                longitude: -77.036667
            ),
            info: "Named after George himself"
        )
        
        /**
        Annotations can be added to the map view one at a time or all at once with addAnnotations
        mapView.addAnnotation(london)
        mapView.addAnnotation(oslo)
        mapView.addAnnotation(paris)
        mapView.addAnnotation(rome)
        mapView.addAnnotation(washington)
         */
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier
            )
            
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(
            title: placeName,
            message: placeInfo,
            preferredStyle: .alert
        )
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
}
