//
//  CarRepositoryStub.swift
//  SixtAppTests
//
//  Created by Yawar Muhammad on 24/03/2022.
//

import Foundation
@testable import SixtApp

struct CarRepositoryStub: CarRepository {
    
    var success = true
    
    func getAll(completion: @escaping ((Result<[Car], Error>) -> Void)) {
        
        guard success else {
            
            return completion(.failure(Mocker.StubError.fake))
        }
        
        let cars: [Car] = [
            
            .init(id: "WMWSW31030T222518",
                  modelIdentifier: "mini",
                  modelName: "MINI",
                  name: "Vanessa",
                  make: "BMW",
                  group: "MINI",
                  color: "midnight_black",
                  series: "MINI",
                  fuelType: "D",
                  fuelLevel: 0.7,
                  transmission: "M",
                  licensePlate: "M-VO0259",
                  latitude: 48.134557,
                  longitude: 11.576921,
                  innerCleanliness: "REGULAR",
                  carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png"),
            
            .init(id: "WMWSU31070T077232",
                  modelIdentifier: "mini",
                  modelName: "MINI",
                  name: "Regine",
                  make: "BMW",
                  group: "MINI",
                  color: "midnight_black",
                  series: "MINI",
                  fuelType: "P",
                  fuelLevel: 0.55,
                  transmission: "M",
                  licensePlate: "M-I7425",
                  latitude: 48.114988,
                  longitude: 11.598359,
                  innerCleanliness: "CLEAN",
                  carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png")
        ]
        completion(.success(cars))
    }
}
