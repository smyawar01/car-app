//
//  ContentView.swift
//  SixtApp
//
//

import SwiftUI

struct SixtAppTabView: View {
    
    let carListFactory: CarListFactory
    let carMapFactory: CarMapFactory
    var body: some View {
        TabView {
            CarMapView(viewModel: carMapFactory.makeModel())
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
        
        let appFactory = AppFactory()
        SixtAppTabView(carListFactory: appFactory.makeCarListFactory(),
                       carMapFactory: appFactory.makeCarMapFactory())
    }
}
