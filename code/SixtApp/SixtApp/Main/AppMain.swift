//
//  SixtAppApp.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import SwiftUI

@main
struct AppMain: App {
    let appFactory = AppFactory()
    var body: some Scene {
        WindowGroup {
            AppTabView(carListFactory: appFactory.makeCarListFactory(),
                           carMapFactory: appFactory.makeCarMapFactory())
        }
    }
}
