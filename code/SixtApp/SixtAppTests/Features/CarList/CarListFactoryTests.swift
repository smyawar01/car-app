//
//  CarListFactoryTests.swift
//  SixtAppTests
//
//  Created by Yawar Muhammad on 25/03/2022.
//

import XCTest
@testable import SixtApp

class CarListFactoryTests: XCTestCase {
    
    var sut: CarListFactory!
    override func setUp() {
        
        let networkService = NetworkServiceMock<Mocker.EmptyResponse>()
        sut = CarListFactory(networkService: networkService)
    }
    
    func test_makeCarListViewModel() {
        
        XCTAssertTrue(sut.makeModel() is CarListViewModelImpl)
    }
}
