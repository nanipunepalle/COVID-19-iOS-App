//
//  MapviewDataModel.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 26/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import Foundation
import MapKit

class MapViewDataModel: NSObject,MKAnnotation{
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(title: String?,
         subtitle: String?,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    static func getData(Countries: [CountryDataModel])-> [MapViewDataModel]{
        
        var all:[MapViewDataModel] = []
        
        for country in Countries {
            let dataToDisplay = "Total Cases: \(country.cases)  Deaths: \(country.deaths)  Recovered: \(country.recovered)"
            let new = MapViewDataModel(title: country.country, subtitle: dataToDisplay, coordinate: .init(latitude: CLLocationDegrees(country.countryInfo.lat), longitude: CLLocationDegrees(country.countryInfo.long)))
            all.append(new)
        }
        return all
    }
    
    
}
