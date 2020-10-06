//
//  EnterpriseDetailView.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 05/10/20.
//

import SwiftUI

struct EnterpriseDetailView: View {
    var body: some View {
        ScrollView() {
            VStack {
                Image("logo_home")
                Text("Nome da empresa")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .frame(width: UIScreen.main.bounds.width, height: 120, alignment: .center)
            .background(Color.blue)

            Spacer()

            Text("""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
""")
        }
    }
}

struct CompanyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EnterpriseDetailView()
    }
}
