//
//  MapViewDelegate.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 26/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import Foundation
import MapKit

class MapViewDelegate: NSObject, MKMapViewDelegate{
    
    var mapViewController: MyView
    
    init(_ control: MyView) {
        self.mapViewController = control
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "view")
        annotationView.canShowCallout = true
        annotationView.image = UIImage(systemName: "square.fill")
        
        return annotationView
    }
    
}
