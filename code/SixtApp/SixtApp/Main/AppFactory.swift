//
//  AppFactory.swift
//  SixtApp
//
//  Created by Yawar Muhammad on 24/03/2022.
//

import Foundation
import CoreData

struct AppFactory {
    
    let networkService: NetworkService
    let databaseService: CoreDataServiceImpl
    init() {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        networkService = NetworkSerivceImpl(session: URLSession.shared,
                                            decoder: decoder)
 //to replace with alamofire
//        networkService = AFNetworkServiceImpl()
        
        let coredataStack = CoreDataStack(fileName: "CarApp")
        databaseService = CoreDataServiceImpl(coredataStack: coredataStack)
    }
}

extension AppFactory {
    
    func makeCarListFactory() -> CarListFactory {
        
        .init(networkService: networkService,
              databaseService: databaseService)
    }
    func makeCarMapFactory() -> CarMapFactory {
        
        .init(networkService: networkService,
              databaseService: databaseService)
    }
}
