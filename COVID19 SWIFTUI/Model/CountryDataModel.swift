//
//  CountryDataModel.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 26/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import Foundation

struct CountryDataModel: Codable,Identifiable{
    var id: String{
        return country
    }
    let country: String
    let countryInfo: countryinfo
    let cases: Int
    let deaths: Int
    let recovered: Int
}

//struct CData: Codable {
//    
//    let country: String
//    let countryInfo: countryinfo
//    let cases: Int
//    let deaths: Int
//    let recovered: Int
//}

struct countryinfo: Codable {
//    let _id: Int
    let lat: Double
    let long: Double
}
