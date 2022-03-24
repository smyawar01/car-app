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
    @State private var region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: 48.04272047607891,
                        longitude: 11.510795092717105),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.04,
                        longitudeDelta: 0.04)
                    )

        var body: some View {
            
            Map(coordinateRegion: $region,
                annotationItems: cars) { MapMarker(coordinate: CLLocationCoordinate2D(latitude: $0.latitude,
                                                                                       longitude: $0.longitude)) }
                .onAppear {
                    
                    viewModel.didStateChange = { state in
                        switch state {
                            
                        case .initial: break
                        case .update(let cars):
                            self.cars = cars
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

struct CarMapView_Previews: PreviewProvider {
    static var previews: some View {
        
        let carMapFactory = AppFactory().makeCarMapFactory()
        CarMapView(viewModel: carMapFactory.makeModel())
    }
}
