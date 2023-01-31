//
//  CarRepositoryTests.swift
//  SixtAppTests
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation
import XCTest
@testable import SixtApp

final class CarRepositoryTests: XCTestCase {

    private var sut: CarRepository!
    private let repository = CarRemoteRepositoryStub()
    
    override func setUp() {
        super.setUp()
        sut = CarRepositoryImpl(carRepositoryRemote: repository)
    }
    
    func testSuccess() {
        expectation { expectation in
            self.sut.getAll { result in
                switch result {
                case .success(let cars):
                    let expected = [Car]()

                    XCTAssertEqual(cars, expected)
                    expectation.fulfill()
                case .failure(_):
                    XCTFail()
                }
            }
        }
    }
    
    func testFailure() {
        repository.success = false
        
        expectation { expectation in
            self.sut.getAll { result in
                switch result {
                case .success(_):
                    XCTFail()
                case .failure(let error):
                    XCTAssertEqual(error as! Mocker.StubError, Mocker.StubError.fake)
                    expectation.fulfill()
                }
            }
        }
        
    }
    
}

private final class CarRemoteRepositoryStub: CarRepository {
    
    var success = true
    
    func getAll(completion: @escaping (Result<[Car], Error>) -> Void) {
        guard success else {
            completion(.failure(Mocker.StubError.fake))
            return
        }
        
        completion(.success([]))
    }
    
}
