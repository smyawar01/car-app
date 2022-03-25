//
//  CarListItem.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import SwiftUI

struct CarListItemView: View {
    
    let viewData: CarViewData
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Title(text: "\(viewData.make) \(viewData.name) \(viewData.modelName)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(5.0)
                .background(Color("AccentColor"))
        HStack {
                AsyncImage(url: URL(string: viewData.carImageUrl)) { image in
                    
                    image
                        .resizable()
                        .scaledToFit()

                } placeholder: {
                    Image("car.placeholder")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 150, height: 75)
            
            VStack(alignment: .leading) {
                HStack {
                    Image("license.plate")
                        .scaledToFit()
                        .frame(width: 40, height: 20)
                    Text(viewData.licensePlate)
                }
                HStack {
                    Image("cleanliness")
                        .scaledToFit()
                        .frame(width: 40, height: 20)
                    Text(viewData.innerCleanliness)
                }
            }
        }
        .padding(.bottom, 10)
        }
    }
}

struct CarListItem_Previews: PreviewProvider {
    static var previews: some View {
        let carViewData = CarViewData(identifier: "abc",
                                      modelName: "MINI",
                                      name: "Vanessa",
                                      make: "BMW",
                                      licensePlate: "M-VO0259",
                                      innerCleanliness: "REGULAR",
                                      carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png",
                                      latitude: 0.0,
                                      longitude: 0.0)
        CarListItemView(viewData: carViewData)
    }
}
