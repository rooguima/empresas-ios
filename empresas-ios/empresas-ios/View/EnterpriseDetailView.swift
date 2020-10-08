//
//  EnterpriseDetailView.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 05/10/20.
//

import SwiftUI

struct EnterpriseDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var enterprise: Enterprise
    var backgroundColor: Color

    init(enterprise: Enterprise, backgroundColor: Color) {
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().isOpaque = true

        self.enterprise = enterprise
        self.backgroundColor = backgroundColor
    }

    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color("pink"))
            }
            .padding(10)
            .background(Color("grey"))
            .cornerRadius(4)
        }
    }

    var body: some View {
        ScrollView() {
            EnterpriseCardView(enterprise: enterprise, backgroundColor: backgroundColor)

            Spacer()

            Text(enterprise.description!)
                .font(.body)
                .fontWeight(.light)
                .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: btnBack)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text(enterprise.enterprise_name!).font(.headline)
                }
            }
        }
    }
}
