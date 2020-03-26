//
//  WorldView.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 26/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import SwiftUI
import MapKit
import Combine

struct WorldView: View{
    
    @ObservedObject var apimanager: APIManager2
    var body: some View {
        MyView(countrydata: apimanager.countryData)
    }
}

struct MyView: UIViewRepresentable{
    
    var countrydata: [CountryDataModel]
    
    func makeCoordinator() -> MapViewDelegate {
        MapViewDelegate(self)
    }
    
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MyView>) {
        //        let coordinate = CLLocationCoordinate2D(latitude: 20, longitude: 77)
        //        let span = MKCoordinateSpan(latitudeDelta: 200.0, longitudeDelta: 200.0)
        //        makeCoordinator()
        let region = MKCoordinateRegion(.world)
        uiView.setRegion(region, animated: true)
        uiView.delegate = context.coordinator
        
        DispatchQueue.main.async {
            let countryData = self.countrydata
            
            let mapData = MapViewDataModel.getData(Countries: countryData)
            print(countryData[0].country)
            print(countryData[1].cases)
            uiView.addAnnotations(mapData)
            //                let countryData = self.apiManager.countryData
            //                print(countryData[0].country)
        }
        
        
//        let mapview = MapViewDataModel(title: "India", coordinate: .init(latitude: 35, longitude: 105))
//        uiView.addAnnotation(mapview)
        
        
    }
    
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView(apimanager: APIManager2())
    }
}
