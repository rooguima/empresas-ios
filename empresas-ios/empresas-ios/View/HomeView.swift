//
//  HomeView.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 05/10/20.
//

import SwiftUI

struct HomeView: View {
    @State private var search: String = ""
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("grey3"))
                    TextField("Pesquise por empresa", text: $search)
                }
                .frame(height: 50)
                .background(Color("grey"))
                .cornerRadius(4)

                Text("04 resultados encontrados")
                    .fontWeight(.light)
                    .foregroundColor(Color("grey3"))

                EnterpriseCardView()
                EnterpriseCardView()
                EnterpriseCardView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
