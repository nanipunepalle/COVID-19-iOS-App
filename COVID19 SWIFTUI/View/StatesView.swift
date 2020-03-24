//
//  StatesView.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 24/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import SwiftUI

struct StatesView: View,APIManagerDelegate {
    func didUpdateStateStats(apiManager: APIManager, indiastats: IndiaStats) {
        //        IndiaStats.data.s
    }
    
    func didUpdateWorldStats(apiManager: APIManager, dataModel: DataModel) {
    }
    
    func didUpdateIndiaStat(apiManager: APIManager, indiaDataModel: IndiaDataModel) {
        
    }
    
    func didFinishWithError(error: Error) {
        
    }
    
    
    @ObservedObject var apiManager = APIManager()
    var body: some View {
        NavigationView{
            List(apiManager.regionalData){ data in
                
                VStack{
                    Text(data.loc).font(.system(size: 30))
                    DashBoardCell2(total: data.confirmedCasesIndian + data.confirmedCasesForeign, indians: data.confirmedCasesIndian, foreigners: data.confirmedCasesForeign, deaths: data.deaths, recovered: data.discharged)
                }
            }.onAppear {
                self.apiManager.performRequest()
            }.navigationBarTitle(Text("States DashBoard")
            .foregroundColor(.red),displayMode: .inline)
                .navigationBarItems(trailing:
            Button("Refresh"){
                self.apiManager.performRequest()
            }.foregroundColor(Color("GreenColor")))
        }

    }
}

struct StatesView_Previews: PreviewProvider {
    static var previews: some View {
        StatesView()
    }
}
