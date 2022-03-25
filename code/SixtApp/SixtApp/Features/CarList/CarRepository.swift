//
//  CarsRepository.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import Foundation

protocol CarRepository {
    
    func getAll(completion: @escaping ((Result<[Car], Error>) -> Void))
}
struct CarRepositoryImpl: CarRepository {
    
    let carRepositoryRemote: CarRepository
    
    func getAll(completion: @escaping ((Result<[Car], Error>) -> Void)) {
        
        carRepositoryRemote.getAll(completion: completion)
    }
}
