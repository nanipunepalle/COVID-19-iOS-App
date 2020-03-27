//
//  TabBarView.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 24/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            WorldView(apimanager: APIManager2()).tabItem {
                Image(systemName: "house.fill")
                Text("World Data")
            }
            ContentView().tabItem{
                Image(systemName: "house.fill")
                Text("Dash Board")
            }
            StatesView().tabItem {
                Image(systemName: "house.fill")
                Text("States data")
            }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
