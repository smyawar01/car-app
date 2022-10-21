//
//  NetworkServiceMock.swift
//  SixtAppTests
//
//  Created by Yawar Muhammad on 25/03/2022.
//

import Foundation
@testable import SixtApp

final class NetworkServiceMock<Model: Decodable>: NetworkService {
    
    var latestUrl: URL?
    var requestCallCount: Int = 0
    var mockResult: Result<Model, Error>?
    
    func execute<Model>(url: URL,
                        completion: @escaping ((Result<Model, Error>) -> Void)) {
    latestUrl = url
    requestCallCount += 1
    if let mockResult = mockResult as? Result<Model, Error> {
            completion(mockResult)
        
    }
    }
}
