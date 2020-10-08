//
//  EnterpriseCardView.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 05/10/20.
//

import SwiftUI

struct EnterpriseCardView: View {
    var enterprise: Enterprise
    var backgroundColor: Color

    var body: some View {
        VStack(spacing: 3) {
            AsyncImageView(
                imageName: enterprise.photo!,
                placeholder: { LoaderView() },
                image: {
                    Image(uiImage: $0)
                        .resizable()
                }
            )
            .scaledToFit()
            .frame(height: 70, alignment: .center)

            Text(enterprise.enterprise_name!)
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .padding()
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: 120,
               alignment: .center)
        .background(backgroundColor)
    }
}
