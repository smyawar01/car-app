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
        HStack {
            
            VStack(alignment: .leading){
                Title(text: "\(viewData.make) \(viewData.name) \(viewData.modelName)")
                    .lineLimit(2)
                AsyncImage(url: URL(string: viewData.carImageUrl)) { image in
                    
                    image
                        .resizable()
                        .scaledToFit()

                } placeholder: {
                    
                    Image("list_item_bg")
                        .resizable()
                        .scaledToFit()
                }
                .frame(width: 150, height: 100)

            }
            VStack(alignment: .leading) {
                Text(viewData.licensePlate)
                Text(viewData.innerCleanliness)
                Text(viewData.carImageUrl)
            }
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
