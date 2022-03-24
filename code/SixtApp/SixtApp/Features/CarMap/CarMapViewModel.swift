//
//  CarMapViewModel.swift
//  SixtApp
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation

protocol CarMapViewModel: AnyObject {
    
    var didStateChange: ((CarListViewState) -> Void)? { get set }
    func fetchCars()
}

final class CarMapViewModelImpl: CarMapViewModel {
    
    let fetchUseCase: FetchCarsUseCase
    var didStateChange: ((CarListViewState) -> Void)?
    
    init(fetchUseCase: FetchCarsUseCase) {
        
        self.fetchUseCase = fetchUseCase
        self.registerUseCaseEvents()
    }
    
    func fetchCars() {
        
        self.update(with: .loading)
        self.fetchUseCase.execute()
    }
}

private extension CarMapViewModelImpl {
    
    func registerUseCaseEvents() {
        
        self.fetchUseCase.onExecuted = { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success((_, let carsViewData)):
                
                self.update(with: .update(carsViewData))
            case .failure(let error):
                self.update(with: .error(error))
            }
        }
    }
    
    func update(with state: CarListViewState) {
        
        DispatchQueue.main.async {
            
            self.didStateChange?(state)
        }
    }
}
