//
//  ViewController.swift
//  Map
//
//  Created by Adakhanau on 18/07/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 4000
    var buildings: [Courses] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCourses()
        let initialLocation = CLLocation(latitude: 42.874722, longitude: 74.612222)
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        mapView.register(ArtworkView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    
    func loadCourses() {
        ServerManager.shared.loadPlaces(completion: updateData)
    }
    
    func updateData(information: [Courses]) {
        self.buildings = information
        showCourses()
    }
    
    func showCourses() {
        for id in 0..<(buildings.count-1) {
            let geolocation = buildings[id].branches![0]
            let artwork = Artwork(title: buildings[id].name!,
                                  locationName: geolocation.address!,
                                  coordinate: CLLocationCoordinate2D(latitude: (geolocation.location!.latitude?.toDouble())!, longitude: (geolocation.location!.longitude?.toDouble())!))
            mapView.addAnnotation(artwork)
        }
    }
    
    
    let locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}


extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Artwork
        let launchOptions = [MKLaunchOptionsDirectionsModeKey:
            MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
}

