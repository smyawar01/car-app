//
//  CarMapFactory.swift
//  SixtApp
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation
import CoreData

struct CarMapFactory {
    
    let networkService: NetworkService
    let databaseService: CoreDataServiceImpl
    
    func makeModel() -> some CarMapViewModel {
        
        return CarMapViewModelImpl(fetchUseCase: makeFetchCarsUseCase())
    }
}

private extension CarMapFactory {
    
    private func makeFetchCarsUseCase() -> FetchCarsUseCase {
        
        return FetchCarsUseCaseImpl(carRepository: makeCarRepository(),
                                    carMapper: makeMapper())
    }
    
    private func makeMapper() -> CarMapper {
        
        return CarMapperImpl()
    }
    
    private func makeCarRepository() -> CarRepository {
        
        return CarRepositoryImpl(networkService: self.networkService,
                                 databaseService: self.databaseService)
    }
}
