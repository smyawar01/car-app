//
//  Mocker.swift
//  SixtAppTests
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation

enum Mocker {
    
    struct EmptyResponse: Decodable {}
    enum StubError: Error {
        case fake
    }
}
