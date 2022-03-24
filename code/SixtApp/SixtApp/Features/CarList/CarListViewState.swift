//
//  CarListViewState.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import Foundation

enum CarListViewState {
    
    case initial
    case loading
    case update([CarViewData])
    case error(Error)
}
