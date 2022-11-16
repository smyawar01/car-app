//
//  CarMapViewModel.swift
//  SixtApp
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation
import NetworkModule

protocol CarMapViewModel: AnyObject {
    
    var didStateChange: ((CarMapViewState) -> Void)? { get set }
    func fetchCars()
}

final class CarMapViewModelImpl: CarMapViewModel {
    
    let fetchUseCase: FetchCarsUseCase
    var didStateChange: ((CarMapViewState) -> Void)?
    
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
                
            case .success((let cars, let carsViewData)):
                
                self.update(with: .update(data: carsViewData,
                                          region: self.regionCenter(from: cars)))
                
            case .failure(let error):
                self.update(with: .error(error))
            }
        }
    }
    
    func update(with state: CarMapViewState) {
        
        DispatchQueue.main.async {
            
            self.didStateChange?(state)
        }
    }
    func regionCenter(from cars: [Car]) -> (lat: Double, lon: Double) {
        
        let maxLatCar = cars.max { $0.latitude < $1.latitude }
        let minLatCar = cars.min { $0.latitude < $1.latitude }
        
        let maxLonCar = cars.max { $0.longitude < $1.longitude }
        let minLonCar = cars.min { $0.longitude < $1.longitude }
        
        let latCenter = ((maxLatCar?.latitude ?? 0.0) + (minLatCar?.latitude ?? 0.0))/2.0
        let lonCenter = ((maxLonCar?.longitude ?? 0.0) + (minLonCar?.longitude ?? 0.0))/2.0
        
        return (latCenter, lonCenter)
    }
}
