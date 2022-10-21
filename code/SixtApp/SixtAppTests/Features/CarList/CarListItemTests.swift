//
//  SixtAppUITests.swift
//  SixtAppUITests
//
//  Created by Yawar Muhammad on 23/03/2022.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import SixtApp

class CarListItemTests: XCTestCase {
    
    func test_carListItem_isRendered() {
        
        let carViewData = CarViewData(id: "abc",
                                      modelName: "MINI",
                                      name: "Vanessa",
                                      make: "BMW",
                                      licensePlate: "M-VO0259",
                                      innerCleanliness: "REGULAR",
                                      carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png",
                                      latitude: 0.0,
                                      longitude: 0.0)
        let carlistItem = CarListItemView(viewData: carViewData)
        let vc = UIHostingController(rootView: carlistItem)
        vc.view.frame = UIScreen.main.bounds
        assertSnapshot(matching: vc, as: .image)
    }
}
