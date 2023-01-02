//
//  CarListFactory.swift
//  SixtApp
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation

struct CarListFactory {
    
    let networkService: NetworkService
    let databaseService: DBService
    
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
        
        let remoteRepository = CarRepositoryRemote(networkService: networkService)
        let localRepository = CarRepositoryLocal(service: databaseService,
                                                 request: makeRequest())
        return CarRepositoryImpl(carRepositoryRemote: remoteRepository,
                                 carRepositoryLocal: localRepository)
    }
    private func makeRequest() -> DBRequest {
        
        return CoreDataRequestBuilder().build()
    }
}
