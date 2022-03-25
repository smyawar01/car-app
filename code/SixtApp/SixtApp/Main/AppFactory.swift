//
//  AppFactory.swift
//  SixtApp
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation

struct AppFactory {
    
    let networkService: NetworkService
    init() {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        networkService = NetworkSerivceImpl(session: URLSession.shared,
                                            decoder: decoder)
    }
}

extension AppFactory {
    
    func makeCarListFactory() -> CarListFactory {
        
        .init(networkService: networkService)
    }
    func makeCarMapFactory() -> CarMapFactory {
        
        .init(networkService: networkService)
    }
}
