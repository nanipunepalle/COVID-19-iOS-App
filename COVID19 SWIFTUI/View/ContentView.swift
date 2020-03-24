//
//  ContentView.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 23/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import SwiftUI

struct ContentView: View,APIManagerDelegate{
    func didUpdateStateStats(apiManager: APIManager, indiastats: IndiaStats) {
        
    }
    
    
    
    @State private var totalCases: Int = 0
    @State private var deaths: Int = 0
    @State private var  recover: Int = 0
    @ObservedObject var apiManager = APIManager()
    @State private var indiacases: Int = 0
    @State private var indiaDeaths: Int = 0
    @State private var indians: Int = 0
    @State private var foreign: Int = 0
    @State private var indiansRecover: Int = 0
    //    @State private var
    
    var width = UIScreen.main.bounds.width
    
    func didUpdateIndiaStat(apiManager: APIManager, indiaDataModel: IndiaDataModel) {
        indiacases = indiaDataModel.total
        indiaDeaths = indiaDataModel.deaths
        indians = indiaDataModel.confirmedCasesIndian
        foreign = indiaDataModel.confirmedCasesForeign
        indiansRecover = indiaDataModel.discharged
    }
    
    func didUpdateWorldStats(apiManager: APIManager, dataModel: DataModel) {
        totalCases = dataModel.cases
        deaths = dataModel.deaths
        recover = dataModel.recovered
        
    }
    
    func didFinishWithError(error: Error) {
        print(error)
    }
    //    init() {
    //        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:  ,.font : UIFont(name: "Georgia-Bold", size: 35)!]
    //    }
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    VStack{
                        Spacer()
                        DashboardCell1(title: "Total Cases", count: totalCases).padding().background(Color("GreenColor")).cornerRadius(20).foregroundColor(.white)
                        Spacer()
                        HStack{
                            Spacer()
                            DashboardCell1(title: "Total Deaths", count: deaths).padding().background(Color("RedColor")).cornerRadius(20).foregroundColor(.white)
                            Spacer()
                            DashboardCell1(title: "Total Recovered", count: recover).padding().background(Color("BlueColor")).cornerRadius(20).foregroundColor(.white)
                            Spacer()
                        }
                        Spacer()
                        
                    }.frame(width: width-40, height: 250, alignment: .center).background(Color("DashColor1")).padding()
                    Text("India Stats").bold().font(.system(size: 30))
                    Spacer()
                    DashBoardCell2(total: indiacases, indians: indians, foreigners: foreign, deaths: indiaDeaths, recovered: indiansRecover)
                    Spacer()
                }
                
            }.onAppear {
                self.apiManager.performRequest()
                self.apiManager.delegate = self
                
            }.navigationBarTitle(Text("Dash Board")
                .foregroundColor(.red),displayMode: .inline)
                .navigationBarItems(trailing:
                    Button("Refresh"){
                        self.apiManager.performRequest()
                    }.foregroundColor(Color("GreenColor")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone Xr")
    }
}

