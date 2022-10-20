//
//  CarViewData.swift
//  SixtApp
//
//  Created by Yawar Muhammad on 23/03/2022.
//

import Foundation
import CoreLocation

struct CarViewData: Identifiable, Equatable {
    
    let id: String
    let modelName: String
    let name: String
    let make: String
    let licensePlate: String
    let innerCleanliness: String
    let carImageUrl: String
    let latitude: Double
    let longitude: Double
}
