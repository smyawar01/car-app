//
//  CarMapperTests.swift
//  SixtAppTests
//
//  Created by Yawar Ali on 24/03/2022.
//

import XCTest
@testable import SixtApp

final class CarMapperTests: XCTestCase {
    
    private var sut: CarMapper!
    
    override func setUp() {
        super.setUp()
        sut = CarMapperImpl()
    }
    
    func test_mapCarToCarViewData() throws {
        let expected = [
            makeCarViewData()
        ]
        let list = [
            makeCar()
        ]
        
        XCTAssertEqual(sut.map(cars: list), expected)
    }
}

private extension CarMapperTests {
    
    func makeCar() -> Car {
        .init(id: "WMWSW31030T222518",
              modelIdentifier: "mini",
              modelName: "MINI",
              name: "Vanessa",
              make: "BMW",
              group: "MINI",
              color: "midnight_black",
              series: "MINI",
              fuelType: "D",
              fuelLevel: 0.7,
              transmission: "M",
              licensePlate: "M-VO0259",
              latitude: 48.134557,
              longitude: 11.576921,
              innerCleanliness: "REGULAR",
              carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png")
    }
    
    func makeCarViewData() -> CarViewData {
        .init(id: "WMWSW31030T222518",
              modelName: "MINI",
              name: "Vanessa",
              make: "BMW",
              licensePlate: "M-VO0259",
              innerCleanliness: "REGULAR",
              carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png",
              latitude: 48.134557,
              longitude: 11.576921)
    }
    
    
}
