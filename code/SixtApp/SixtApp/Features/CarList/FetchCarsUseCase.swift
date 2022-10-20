//
//  FetchCarsUseCase.swift
//  SixtApp
//
//  Created by Yawar Muhammad on 23/03/2022.
//

import Foundation

protocol FetchCarsUseCase: AnyObject {
    
    typealias Response = ((Result<([Car], [CarViewData]), Error>) -> Void)
    var onExecuted: Response? { get set }
    func execute()
}

class FetchCarsUseCaseImpl: FetchCarsUseCase {
    
    let carRepository: CarRepository
    let carMapper: CarMapper
    var onExecuted: Response?
    
    init(carRepository: CarRepository, carMapper: CarMapper) {
        
        self.carRepository = carRepository
        self.carMapper = carMapper
    }
    
    func execute() {
        
        carRepository.getAll { [weak self] result in
            
            guard let self = self else { return }
            switch result {
                
            case .success(let cars):
                self.onExecuted?(.success((cars, self.carMapper.map(cars: cars))))
            case .failure(let error):
                self.onExecuted?(.failure(error))
            }
        }
    }
}
