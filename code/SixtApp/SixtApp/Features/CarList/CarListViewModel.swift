//
//  CarListViewModel.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import Foundation

protocol CarListViewModel: ObservableObject {
    
    var viewState: CarListViewState { get set }
    func fetchCarList()
}

class CarListViewModelImpl: CarListViewModel {
    
    @Published var viewState: CarListViewState = .initial
    
    let fetchUseCase: FetchCarsUseCase
    
    init(fetchUseCase: FetchCarsUseCase) {
        
        self.fetchUseCase = fetchUseCase
        registerUseCaseEvents()
    }
    func fetchCarList() {
        
        self.update(with: .loading)
        self.fetchUseCase.execute()
    }
}

private extension CarListViewModelImpl {
    
    func registerUseCaseEvents() {
        
        self.fetchUseCase.onExecuted = { result in
            
            switch result {
                
            case .success(( _ , let carsViewData)):
                self.update(with: .update(carsViewData))
            case .failure(let error):
                self.update(with: .error(error))
            }
        }
    }
    func update(with state: CarListViewState) {
        
        DispatchQueue.main.async {
            
            self.viewState = state
        }
    }
}
