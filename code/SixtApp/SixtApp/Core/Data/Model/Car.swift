//
//  Car.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import Foundation

struct Car: Decodable, Equatable {
    
    let id: String
    let modelIdentifier: String
    let modelName: String
    let name: String
    let make: String
    let group: String
    let color: String
    let series: String
    let fuelType: String
    let fuelLevel: Double
    let transmission: String
    let licensePlate: String
    let latitude: Double
    let longitude: Double
    let innerCleanliness: String
    let carImageUrl: String
}
