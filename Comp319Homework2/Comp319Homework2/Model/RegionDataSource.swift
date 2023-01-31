//
//  CityDataSource.swift
//  Comp319Homework2
//
//  Created by BURAK on 25.11.2022.
//

import Foundation

class RegionDataSource {
    private var regionArray: [Region] = []
    private let baseURL = "https://koc.api.staging.tarentum.io"
    var delegate: RegionDataDelegate?
    
    init() {
    }
    func getListOfRegions(with cityID: Int){
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/city/\(cityID)/region") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request){
                data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        self.regionArray = try decoder.decode([Region].self, from: data)
                        DispatchQueue.main.async {
                            self.delegate?.regionListLoaded()
                        }
                    } catch {
                        print("Regions cannot be decoded!")
                    }
                    
                }
            }
            dataTask.resume()
        }
    }
    func getNumberOfRegions() -> Int{
        return regionArray.count
    }

    func getRegion(for index: Int) -> Region? {
        guard index < regionArray.count else {
            return nil
        }
        return regionArray[index]
    }
    
}
