//
//  PharmacyDataSource.swift
//  Comp319Homework2
//
//  Created by BURAK on 25.11.2022.
//

import Foundation

class PharmacyDataSource {
    private var pharmacyArray: [Pharmacy] = []
    private var pharmacyDetailArray: [PharmacyDetails] = []
    private let baseURL = "https://koc.api.staging.tarentum.io"
    var delegate: PharmacyDataDelegate?
    
    init() {
    }
    func getListOfPharmacies(with regionID: String){
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/region/\(regionID)/pharmacy") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request){
                data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        self.pharmacyArray = try decoder.decode([Pharmacy].self, from: data)
                        DispatchQueue.main.async {
                            self.delegate?.pharmacyListLoaded()
                        }
                    } catch {
                        print("Pharmacies cannot be decoded!")
                    }
                    
                }
            }
            dataTask.resume()
        }
    }
    func getNumberOfPharmacies() -> Int{
        return pharmacyArray.count
    }

    func getPharmacy(for index: Int) -> Pharmacy? {
        guard index < pharmacyArray.count else {
            return nil
        }
        return pharmacyArray[index]
    }
    
    func getPharmacy(with Id: String) {
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/pharmacy/\(Id)"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) {
                data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let pharmacy = try decoder.decode(PharmacyDetails.self, from: data)
                        DispatchQueue.main.async {
                            self.delegate?.pharmacyDetailLoaded(pharmacy: pharmacy)
                        }
                    } catch {
                        print("Pharmacy cannot be decoded!")
                    }
                }
            }
            dataTask.resume()
        }
    }
    
}
