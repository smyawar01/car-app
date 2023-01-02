//
//  CarMapper.swift
//  SixtApp
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation

protocol CarMapper {
    
    func map(cars: [CarDTO]) -> [CarViewData]
}

struct CarMapperImpl: CarMapper {
    
    func map(cars: [CarDTO]) -> [CarViewData] {
        
        return cars.map { car in
            
            CarViewData(id: car.id,
                        modelName: car.modelName,
                        name: car.name,
                        make: car.make,
                        licensePlate: car.licensePlate,
                        innerCleanliness: car.innerCleanliness,
                        carImageUrl: car.carImageUrl,
                        latitude: car.latitude,
                        longitude: car.longitude)
        }
    }
}
