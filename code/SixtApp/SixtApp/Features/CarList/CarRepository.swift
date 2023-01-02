//
//  CarsRepository.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import Foundation

protocol CarRepository {
    
    func getAll(completion: @escaping ((Result<[CarDTO], Error>) -> Void))
}
struct CarRepositoryImpl: CarRepository {
    
    let carRepositoryRemote: CarRepository
    let carRepositoryLocal: CarRepository
    
    let forceUpdate: Bool
    
    func getAll(completion: @escaping ((Result<[CarDTO], Error>) -> Void)) {
        
        if forceUpdate {
            
            carRepositoryRemote.getAll(completion: completion)
        }
    }
}
