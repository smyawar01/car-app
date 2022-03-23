//
//  ContentView.swift
//  SixtApp
//
//

import SwiftUI

struct SixtAppTabView: View {
    var body: some View {
        TabView {
            CarMapView()
                .tabItem {
                    Text("Map")
                }
            CarListView()
                .tabItem {
                    Text("List")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SixtAppTabView()
    }
}
