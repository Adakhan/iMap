//
//  ArtworkView.swift
//  Map
//
//  Created by Adakhanau on 22/07/2019.
//  Copyright © 2019 Adakhan. All rights reserved.
//

import Foundation
import MapKit

class ArtworkMarkerView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
        }
    }
    
}

class ArtworkView: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let artwork = newValue as? Artwork else {return}
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                                    size: CGSize(width: 30, height: 30)))
            mapsButton.setBackgroundImage(UIImage(named: "Maps-icon"), for: UIControl.State())
            rightCalloutAccessoryView = mapsButton
            //      rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            if let imageName = artwork.imageName {
                image = UIImage(named: imageName)
            } else {
                image = nil
            }
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = artwork.subtitle
            detailCalloutAccessoryView = detailLabel
        }
    }
    
}

