//
//  CarMapViewState.swift
//  SixtApp
//
//  Created by Yawar Ali on 24/03/2022.
//

import Foundation

enum CarMapViewState {
    
    case initial
    case loading
    case update(data: [CarViewData], region: (Double, Double))
    case error(Error)
}
