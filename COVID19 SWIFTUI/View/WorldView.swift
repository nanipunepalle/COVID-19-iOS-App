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
        NavigationView{
            MyView(countrydata: apimanager.countryData)
                .navigationBarTitle(Text("Dash Board")
                .foregroundColor(.red),displayMode: .inline)
                .navigationBarItems(trailing:
                Button("Refresh"){
                    self.apimanager.fetchData()
                })
        }
        
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

        let region = MKCoordinateRegion(.world)
        uiView.setRegion(region, animated: true)
        uiView.delegate = context.coordinator
        
        DispatchQueue.main.async {
            let countryData = self.countrydata
            let mapData = MapViewDataModel.getData(Countries: countryData)
            uiView.isZoomEnabled = true
            uiView.addAnnotations(mapData)
        }
        
    }
    
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView(apimanager: APIManager2())
    }
}
