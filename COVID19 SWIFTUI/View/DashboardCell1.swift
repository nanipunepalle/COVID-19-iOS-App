//
//  DashboardCell1.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 23/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import SwiftUI

struct DashboardCell1: View {
    var title: String
    var count: Int
    var body: some View {
        VStack{
            Text(String(count))
                .font(.system(size: 30))
            Text(title)
            .font(.system(size: 20))
            
        }
    }
}

struct DashboardCell1_Previews: PreviewProvider {
    static var previews: some View {
        DashboardCell1(title: "TotalCases", count: 3456789)
    }
}
