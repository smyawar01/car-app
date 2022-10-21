//
//  ContentView.swift
//  SixtApp
//
//

import SwiftUI

struct AppTabView: View {
    
    let carListFactory: CarListFactory
    let carMapFactory: CarMapFactory
    
    init(carListFactory: CarListFactory, carMapFactory: CarMapFactory) {
        
        self.carListFactory = carListFactory
        self.carMapFactory = carMapFactory
        
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(named:"SecondaryColor")
        UITabBar.appearance().backgroundColor = UIColor(named:"SecondaryColor")
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
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
        .accentColor(Color("AccentColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let appFactory = AppFactory()
        AppTabView(carListFactory: appFactory.makeCarListFactory(),
                       carMapFactory: appFactory.makeCarMapFactory())
    }
}
