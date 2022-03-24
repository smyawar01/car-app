//
//  ContentView.swift
//  SixtApp
//
//

import SwiftUI

struct SixtAppTabView: View {
    
    let carListFactory: CarListFactory
    var body: some View {
        TabView {
            CarMapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            CarListView(viewModel: carListFactory.makeModel())
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("List")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        SixtAppTabView(carListFactory: AppFactory().makeCarListFactory())
    }
}
