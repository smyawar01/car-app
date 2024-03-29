//
//  NetworkService.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import Foundation
import Alamofire

protocol NetworkService {
    
    func execute<Model: Decodable>(url: URL, completion: @escaping ((Result<Model, Error>) -> Void))
}

struct NetworkSerivceImpl: NetworkService {
    
    let session: URLSession
    let decoder: JSONDecoder
    
    func execute<Model: Decodable>(url: URL, completion: @escaping ((Result<Model, Error>) -> Void)) {
        
        session.dataTask(with: url) { data , response, error in
            
            if let error = error {
                
                completion(.failure(NetworkError.transportError(error)))
                return
            }
            if let response = response as? HTTPURLResponse, !(200..<300).contains(response.statusCode) {
                
                completion(.failure(NetworkError.serverError(response.statusCode)))
                return
            }
            guard let data = data else {
                
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                
                let model = try decoder.decode(Model.self, from: data)
                completion(.success(model))
                
            } catch let error {
                
                completion(.failure(NetworkError.decodingError(error)))
            }
        }
        .resume()
    }
}

struct AFNetworkServiceImpl: NetworkService {
    
    func execute<Model: Decodable>(url: URL, completion: @escaping ((Result<Model, Error>) -> Void)) {
        
        let request = AF.request(url)
        request.responseDecodable(of: Model.self) { dataResponse in
            
            switch dataResponse.result {
                
            case .success(let model):
                completion(.success(model))
            case .failure(let afError):
                if let error = afError as Error? {
                    completion(.failure(error))
                }
            }
        }
    }
}
