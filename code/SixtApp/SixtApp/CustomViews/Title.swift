//
//  Title.swift
//  SixtApp
//
//  Created by Yawar Ali on 23/03/2022.
//

import SwiftUI

struct Title: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(text: "Vanessa Mini")
    }
}
