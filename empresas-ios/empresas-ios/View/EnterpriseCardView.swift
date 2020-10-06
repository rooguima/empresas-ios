//
//  EnterpriseCardView.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 05/10/20.
//

import SwiftUI

struct EnterpriseCardView: View {
    var body: some View {
        VStack {
            Image("logo_home")
            Text("Nome da empresa")
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .frame(width: UIScreen.main.bounds.width, height: 120, alignment: .center)
        .background(Color.blue)
    }
}

struct CompanyCardView_Previews: PreviewProvider {
    static var previews: some View {
        EnterpriseCardView()
    }
}
