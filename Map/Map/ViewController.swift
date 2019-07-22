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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 42.874722, longitude: 74.612222)
        centerMapOnLocation(location: initialLocation)
        

    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}

