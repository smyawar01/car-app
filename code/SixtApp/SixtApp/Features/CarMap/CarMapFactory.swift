//
//  CarMapFactory.swift
//  SixtApp
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation

struct CarMapFactory {
    
    let networkService: NetworkService
    
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
        
        let remoteRepository = CarRepositoryRemote(networkService: networkService)
        return CarRepositoryImpl(carRepositoryRemote: remoteRepository)
    }
}
