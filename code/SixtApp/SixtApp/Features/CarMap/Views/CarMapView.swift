//
//  CarMapView.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import SwiftUI
import MapKit

struct CarMapView: View {
    
    let viewModel: CarMapViewModel
    @State private var cars = [CarViewData]()
    @State private var showingAlert = false
    @State private var region = CarMapView.region(from: 48.04272047607891, longitude: 11.510795092717105)

        var body: some View {
            
            Map(coordinateRegion: $region,
                annotationItems: cars) {
                MapAnnotation(coordinate:
                                CLLocationCoordinate2D(latitude: $0.latitude,
                                                       longitude: $0.longitude)) {
                    
                    Image("map.pin")
                }
            }
                .edgesIgnoringSafeArea(.top)
                .onAppear {
                    
                    viewModel.didStateChange = { state in
                        switch state {
                            
                        case .initial: break
                        case .update(let cars, let regionCenter):
                            self.cars = cars
                            self.region = CarMapView.region(from: regionCenter.0, longitude: regionCenter.1)
                        case .loading:
                            ProgressView()
                        case .error(_):
                            showingAlert = true
                        }
                    }
                    viewModel.fetchCars()
                }
                .alert("Error", isPresented: $showingAlert) {
                    
                    Button("OK", role: .cancel) {
                        
                        showingAlert = false
                    }
                }
        }
}

extension CarMapView {
    
   static func region(from latitude: Double, longitude: Double) -> MKCoordinateRegion {
        
        MKCoordinateRegion(
                        center: CLLocationCoordinate2D(
                            latitude: latitude,
                            longitude: longitude),
                        span: MKCoordinateSpan(
                            latitudeDelta: 0.2,
                            longitudeDelta: 0.2)
                        )
    }
}

struct CarMapView_Previews: PreviewProvider {
    static var previews: some View {
        
        let carMapFactory = AppFactory().makeCarMapFactory()
        CarMapView(viewModel: carMapFactory.makeModel())
    }
}
