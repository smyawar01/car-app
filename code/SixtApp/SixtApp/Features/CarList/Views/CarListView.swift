//
//  CarListView.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import SwiftUI

struct CarListView<Model>: View where Model: CarListViewModel {
    
    @ObservedObject
    var viewModel: Model
    var body: some View {
        
        content(state: viewModel.viewState )
            .onAppear {

                viewModel.fetchCarList()
            }
    }
    
    @ViewBuilder
    func content(state: CarListViewState) -> some View {
        
        switch state {
        case .initial:
            Text("Loading....")
        case .loading:
            ProgressView()
        case .update(let cars):
            
            List(cars, id: \.id) { car in
                
                CarListItemView(viewData: car)
            }
        case .error(let error):
            
            Text(error.localizedDescription)
        }
    }
}

struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let carlistFactory = AppFactory().makeCarListFactory()
        CarListView(viewModel: carlistFactory.makeModel())
    }
}
