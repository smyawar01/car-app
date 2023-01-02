//
//  CarListViewModelTests.swift
//  SixtAppTests
//
//  Created by Yawar Muhammad on 23/03/2022.
//

import XCTest
@testable import SixtApp

class CarListViewModelTests: XCTestCase {
    
    private var sut: CarListViewModelImpl!
    private var fetchUseCase: FetchCarsUseCaseStub!
    override func setUp() {
        
        fetchUseCase = FetchCarsUseCaseStub()
        fetchUseCase.mockResult = .success(([],[]))
        sut = CarListViewModelImpl(fetchUseCase: fetchUseCase)
    }
    
    func test_fetchList_success() throws {
        
        expectation { expectation in
            
            expectation.fulfill()
        }
        sut.fetchCarList()
    }
}

class FetchCarsUseCaseStub: FetchCarsUseCase {
    var onExecuted: Response?
    var mockResult: Result<([CarDTO], [CarViewData]), Error>?
    func execute() {
        
        onExecuted?(mockResult!)
    }
}
