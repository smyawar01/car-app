//
//  Error.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import Foundation


enum NetworkError: Error {
    
    case transportError(Error)
    case serverError(Int)
    case noData
    case decodingError(Error)
}
