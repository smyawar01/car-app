//
//  CarRepositoryRemote.swift
//  SixtApp
//
//  Created by Yawar Muhammad on 23/03/2022.
//

import Foundation

struct CarRepositoryRemote: CarRepository {
    
    let networkService: NetworkService
    
    func getAll(completion: @escaping ((Result<[Car], Error>) -> Void)) {
        
        networkService.execute(url: URL(string: "https://cdn.sixt.io/codingtask/cars")!,
                               completion: completion)
    }
}
