//
//  APIManager.swift
//  COVID-19
//
//  Created by Lalith on 23/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import Foundation

protocol APIManagerDelegate {
    func didUpdateWorldStats(apiManager: APIManager,dataModel: DataModel)
    func didUpdateIndiaStat(apiManager: APIManager,indiaDataModel: IndiaDataModel)
    func didFinishWithError (error: Error)
    func didUpdateStateStats(apiManager: APIManager,indiastats: IndiaStats)
}

class APIManager: ObservableObject{
    let url1 = "https://corona.lmao.ninja/all"
    let url2 = "https://api.rootnet.in/covid19-in/stats/latest"
    var delegate: APIManagerDelegate?
    @Published var regionalData = [Regional]()
    
    func performRequest(){
        if let url = URL(string: url1),let iurl = URL(string: url2){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let task1 = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFinishWithError(error: error!)
                    return
                }
                if let safeData = data{
                    let decoder = JSONDecoder()
                    do{
                        let decoded = try decoder.decode(WorldStats.self, from: safeData)
                        let totalCases = decoded.cases
                        let deaths = decoded.deaths
                        let recovered = decoded.recovered
                        let stats = DataModel(cases: totalCases, deaths: deaths, recovered: recovered)
                        self.delegate?.didUpdateWorldStats(apiManager: self, dataModel: stats)
                        
                    }
                    catch{
                        self.delegate?.didFinishWithError(error: error)
                        return
                    }
                    
                }
            }
            task1.resume()
            var request2 = URLRequest(url: iurl)
            request2.httpMethod = "GET"
            let task2 = URLSession.shared.dataTask(with: request2) { (data, response, err) in
                if err != nil{
                    self.delegate?.didFinishWithError(error: err!)
                }
                if let safedata = data{
                    let decoder = JSONDecoder()
                    do{
                        let decoded = try decoder.decode(IndiaStats.self, from: safedata)
                        let total = decoded.data.summary.total
                        let indian = decoded.data.summary.confirmedCasesIndian
                        let foreign = decoded.data.summary.confirmedCasesForeign
                        let deaths = decoded.data.summary.deaths
                        let recovered = decoded.data.summary.discharged
                        
                        DispatchQueue.main.async {
                            self.regionalData = decoded.data.regional
//                            print(self.regionalData.loc)
                        }
                        
                        let new = IndiaDataModel(total: total, confirmedCasesIndian: indian, confirmedCasesForeign: foreign, deaths: deaths, discharged: recovered)
                        self.delegate?.didUpdateIndiaStat(apiManager: self, indiaDataModel: new)
//                        print(total)
                    }
                    catch{
                        self.delegate?.didFinishWithError(error: error)
                    }
                    
                }
            }
            task2.resume()
            
        }
    }
}
