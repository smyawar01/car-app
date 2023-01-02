//
//  CarRepositoryLocal.swift
//  SixtApp
//
//  Created by muhammad Yawar on 12/22/22.
//

import Foundation
import CoreData

// Request abstraction
protocol DBRequest { }

// Request building abstraction
protocol DBRequestBuilder {
    
    func build() -> DBRequest
}

// Framework need to adopt abstraction
extension NSFetchRequest: DBRequest { }

// Concrete request builder class
final class CoreDataRequestBuilder<Entity: NSManagedObject>: DBRequestBuilder {
    
    private (set) var fetchRequest: NSFetchRequest<NSFetchRequestResult>?
    private (set) var predicate: NSPredicate?
    private (set) var sortDescriptor: NSSortDescriptor?
    
    func build() -> DBRequest {
        
        fetchRequest = Entity.fetchRequest()
        fetchRequest?.predicate = predicate
        fetchRequest?.sortDescriptors = sortDescriptor
        return request
    }
}

final class RealmRequestBuilder: DBRequestBuilder {
    
    func build -> DBRequest {
        
        Realm Specific implementation
    }
}

// Database interface abstraction
protocol DBService {
    
    func execute<Request: DBRequest>(request: Request) -> Result<[Car], Error>
}

// Concrete DB interface implementation specific to framework
struct CoreDataServiceImpl: DBService {
    
    let stack: CoreDataStack
    func execute<Request: DBRequest>(request: Request) -> Result<[Car], Error> {
        
        stack.backgroundContext()
        stack.ViewContext()
    }
}

struct ManagedCarMapper {
    
    func map(cars: [Car]) -> [CarDTO] {
        
        let carDtos = cars.map { car in
            
            return CarDTO(id: car.id ?? "",
                          name: car.name ?? "",
                          modelIdentifier: car.modelIdentifier ?? "",
                          modelName: car.modelName ?? "",
                          make: car.make ?? "",
                          group: car.group ?? "",
                          color: car.color ?? "",
                          series: car.series ?? "",
                          fuelType: car.fuelType ?? "",
                          fuelLevel: car.fuelLevel,
                          transmission: car.transmission ?? "",
                          licensePlate: car.licensePlate ?? "",
                          latitude: car.latitude,
                          longitude: car.longitude,
                          innerCleanliness: car.innerCleanliness ?? "",
                          carImageUrl: car.carImageUrl ?? "")
        }
        return carDtos
    }
}

// Local Repository to interact with database service

struct CarRepositoryLocal<Request: DBRequest>: CarRepository {
    
    let dbService: DBService
    let dbRequest: Request
    
    init(service: DBService, request: Request) {
        
        self.dbService = service
        self.dbRequest = request
    }
    
    func getAll(completion: @escaping ((Result<[CarDTO], Error>) -> Void)) {
        
        let response = dbService.execute(request: dbRequest)
        switch(response) {
        case .success(let cars):
            completion(.success(ManagedCarMapper().map(cars: cars)))
        case .failure(let error):
            
            completion(.failure(error))
        }
    }
}


struct CoreDataStack {
    
    let modelFileName: String
    private persistentContainer = NSPersistentContainer(name: modelFileName,
                                                        managedObjectModel: )
    public private(set) lazy var mainContext = NSManagedObjectContext {
        
        return persistentconcontainer
    }
}
