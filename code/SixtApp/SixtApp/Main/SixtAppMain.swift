//
//  SixtAppApp.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import SwiftUI

@main
struct SixtAppMain: App {
    let appFactory = AppFactory()
    var body: some Scene {
        WindowGroup {
            SixtAppTabView(carListFactory: appFactory.makeCarListFactory())
        }
    }
}
