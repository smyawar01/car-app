//
//  CarListFactory.swift
//  SixtApp
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation
import swift_database_module

struct CarListFactory {
    
    let networkService: NetworkService
    let databaseService: CoreDataServiceImpl
    
    func makeModel() -> some CarListViewModel {
        
        return CarListViewModelImpl(fetchUseCase: makeFetchCarsUseCase())
    }
}

private extension CarListFactory {
    
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
