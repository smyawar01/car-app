//
//  XCTestCase+Additions.swift
//  SixtAppTests
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation

import XCTest

extension XCTestCase {
    
    func expectation(timeout: TimeInterval = 1.0,
                     handler: @escaping (XCTestExpectation) -> Void) {
        let expectation = XCTestExpectation(description: "com.sixt.app.async.expectation")
        handler(expectation)
        wait(for: [expectation], timeout: timeout)
    }
    
}
