//
//  CarDTO.swift
//  SixtApp
//
//  Created by muhammad Yawar on 12/29/22.
//

import Foundation

struct CarDTO: Decodable {
    
    var id: String
    var name: String
    var modelIdentifier: String
    var modelName: String
    var make: String
    var group: String
    var color: String
    var series: String
    var fuelType: String
    var fuelLevel: Double
    var transmission: String
    var licensePlate: String
    var latitude: Double
    var longitude: Double
    var innerCleanliness: String
    var carImageUrl: String
}
