//
//  CarMapView.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import SwiftUI
import MapKit

struct CarMapView: View {
    
    @State private var region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: 48.04272047607891,
                        longitude: 11.510795092717105),
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.03,
                        longitudeDelta: 0.03)
                    )

        var body: some View {
            Map(coordinateRegion: $region)
        }
}

struct CarMapView_Previews: PreviewProvider {
    static var previews: some View {
        CarMapView()
    }
}
