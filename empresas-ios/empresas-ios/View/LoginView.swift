//
//  LoginView.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 05/10/20.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            VStack {
                Image("logo_home")
                Text("Seja bem vindo ao empresas!")
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width, height: 150)
            .background(Color("pink"))

            Spacer()

            VStack(alignment: .leading) {
                Text("Email")
                    .foregroundColor(Color("grey4"))

                TextField("", text: $email)
                    .frame(height: 50)
                    .background(Color("grey"))
                    .cornerRadius(4)

                Text("Senha")
                    .foregroundColor(Color("grey4"))

                ZStack(alignment: .trailing) {
                    TextField("", text: $password)
                        .frame(height: 50)
                        .background(Color("grey"))
                        .cornerRadius(4)

                    Image(systemName: "eye.fill")
                        .foregroundColor(Color("grey3"))
                }
                
                Button("ENTRAR", action: {})
                    .frame(width: UIScreen.main.bounds.width, height: 50)
                    .background(Color("pink"))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold, design: .default))
            }

            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
