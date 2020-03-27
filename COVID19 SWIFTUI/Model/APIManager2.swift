//
//  APIManager2.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 26/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import Foundation
import Combine

class APIManager2: ObservableObject {
    var didChange = PassthroughSubject<Void,Never>()
    @Published var countryData = [CountryDataModel]() {
        didSet {
            didChange.send(())
        }
    }
    init() {
        self.fetchData()
    }
    
    func fetchData() {
        let url1 = "https://corona.lmao.ninja/countries"
        if let wurl = URL(string: url1){
            var request3 = URLRequest(url: wurl)
            request3.httpMethod = "GET"
            let task3 = URLSession.shared.dataTask(with: request3) { (data, response, err) in
                if err != nil{
                    print(err ?? "error")
                }
                if let safeData = data{
                    let decoder = JSONDecoder()
                    do{
                        let decoded = try decoder.decode([CountryDataModel].self, from: safeData)
                        DispatchQueue.main.async {
                            
                            self.countryData = decoded
                            
                        }
                        
                    }
                    catch{
                        print(error)
                    }
                }
            }
            task3.resume()
        }
        
        
    }
    
}

//guard let url = URL(string: "https://corona.lmao.ninja/countries") else { return }
//URLSession.shared.dataTask(with: url) { (data, response, error) in
//    guard let data = data else { return }
//    let decoded = try! JSONDecoder().decode([CountryDataModel].self, from: data)
//    DispatchQueue.main.async {
//        self.countryData = decoded
//    }
//    print("API values fetched Successfully")
//}.resume()
