//
//  CarListViewTests.swift
//  SixtAppTests
//
//  Created by muhammad Yawar on 10/20/22.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import SixtApp

class CarListViewTests: XCTestCase {
    
    func test_listView_isLoading() throws {
        
        let vm = CarListViewModelStub()
        vm.viewState = .loading
        let view = CarListView(viewModel: vm)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        assertSnapshot(matching: vc, as: .image)
    }
    func test_listView_listLoaded() throws {
        
        let vm = CarListViewModelStub()
        vm.viewState = .update(makeCarViewData())
        let view = CarListView(viewModel: vm)
        let vc = UIHostingController(rootView: view)
        vc.view.frame = UIScreen.main.bounds
        assertSnapshot(matching: vc, as: .image)
    }
    private func makeCarViewData() -> [CarViewData] {
        
        return [
            .init(id: "WMWSW31030T222518",
                  modelName: "MINI",
                  name: "Vanessa",
                  make: "BMW",
                  licensePlate: "M-VO0259",
                  innerCleanliness: "REGULAR",
                  carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png",
                  latitude: 48.134557,
                  longitude: 11.576921),
            .init(id: "WMWSW31030T222518",
                  modelName: "MINI",
                  name: "Vanessa",
                  make: "BMW",
                  licensePlate: "M-VO0259",
                  innerCleanliness: "REGULAR",
                  carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png",
                  latitude: 48.134557,
                  longitude: 11.576921)
        ]
    }
}

class CarListViewModelStub: CarListViewModel {
    
    var viewState: CarListViewState = .initial
    func fetchCarList() {
    }
}
