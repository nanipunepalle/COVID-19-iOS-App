//
//  IndiaStats.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 23/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import Foundation

struct IndiaStats: Codable{
    let data:Data
}

struct Data: Codable{
    
    let summary:Summary
    let regional: [Regional]
}

struct Summary: Codable {
    let total: Int
    let confirmedCasesIndian: Int
    let confirmedCasesForeign: Int
    let deaths: Int
    let discharged: Int
}

struct Regional: Codable,Identifiable{
    var id: String{
        return loc
    }
    let loc: String
    let confirmedCasesIndian: Int
    let confirmedCasesForeign: Int
    let deaths: Int
    let discharged: Int
}
