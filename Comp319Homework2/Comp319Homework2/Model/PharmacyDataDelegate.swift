//
//  PharmacyDataDelegate.swift
//  Comp319Homework2
//
//  Created by BURAK on 25.11.2022.
//

import Foundation

protocol PharmacyDataDelegate {
    func pharmacyListLoaded()
    func pharmacyDetailLoaded(pharmacy: PharmacyDetails)
}

extension PharmacyDataDelegate {
    func pharmacyListLoaded() {}
    func pharmacyDetailLoaded(pharmacy: PharmacyDetails) {}
}
