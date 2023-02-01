//
//  CarsRepository.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import Foundation
import CoreData

protocol CarRepository {
    
    func getAll(completion: @escaping ((Result<[Car], Error>) -> Void))
}
struct CarRepositoryImpl: CarRepository {
    
    let networkService: NetworkService
    let databaseService: CoreDataServiceImpl
    
    init(networkService: NetworkService, databaseService: CoreDataServiceImpl) {
        
        self.networkService = networkService
        self.databaseService = databaseService
    }
    func getAll(completion: @escaping ((Result<[Car], Error>) -> Void)) {
        
        networkService.execute(url: URL(string: "https://cdn.sixt.io/codingtask/cars")!) { (result: Result<[Car], Error>) in
            
            switch result {
            case .success(let cars):
                
                self.saveCarData(models: cars)
                completion(.success(cars))
                
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
    private func saveCarData(models: [Car]) {
        
        do {
            
            try self.databaseService.createAll(entityType: ManagedCar.self,
                                               objectCount: models.count) { (managedCar, index) in
                
                guard index < models.count, let managedCar = managedCar as? ManagedCar else {
                    
                    return
                }
                let car = models[index]
                
                managedCar.id = car.id
                managedCar.fuelType = car.fuelType
                managedCar.fuelLevel = car.fuelLevel
                managedCar.group = car.group
                managedCar.innerCleanliness = car.innerCleanliness
                managedCar.carImageUrl = car.carImageUrl
                managedCar.latitude = car.latitude
                managedCar.longitude = car.longitude
                managedCar.licensePlate = car.licensePlate
                managedCar.make = car.make
                managedCar.modelName = car.modelName
                managedCar.modelIdentifier = car.modelIdentifier
                managedCar.series = car.series
                managedCar.transmission = car.transmission
                managedCar.color = car.color
                managedCar.name = car.name
            }
        } catch(let error) {
            
            fatalError("Error saving data: \(error.localizedDescription)")
        }
    }
}
