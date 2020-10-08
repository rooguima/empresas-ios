//
//  LoginView.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 05/10/20.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()

    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(height: viewModel.isEditing ? 60 : 100)
                    .offset(y: viewModel.isEditing ? 20 : 0)

                Text("Seja bem vindo ao empresas!")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(height: viewModel.isEditing ? 0 : 30)
                    .opacity(viewModel.isEditing ? 0 : 1)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: viewModel.isEditing ? 80 : 250,
                   alignment: .center)
            .background(TopShape()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("Gradient5"), Color("Gradient6")]),
                                                 startPoint: .bottomLeading,
                                                 endPoint: .topTrailing)))

            Spacer()

            VStack(alignment: .leading) {
                Text("Email")
                    .foregroundColor(Color("grey4"))

                ZStack(alignment: .trailing) {
                    TextField("", text: $viewModel.email)
                        .padding()

                    if viewModel.invalidCredentials {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
                .frame(height: 50)
                .background(Color("grey"))
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.red, lineWidth: 2)
                            .opacity(viewModel.invalidCredentials ? 1 : 0))

                Text("Senha")
                    .foregroundColor(Color("grey4"))

                ZStack(alignment: .trailing) {
                    SecureField("", text: $viewModel.password)
                        .padding()
                        .opacity(viewModel.isSecure ? 1 : 0)
                    TextField("", text: $viewModel.password)
                        .padding()
                        .opacity(viewModel.isSecure ? 0 : 1)

                    if viewModel.invalidCredentials {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        Button(action: {
                            viewModel.isSecure = !viewModel.isSecure
                        }, label: {
                            Image(systemName: "eye.fill")
                                .foregroundColor(Color("grey3"))
                                .padding()
                        })
                    }
                }
                .frame(height: 50)
                .background(Color("grey"))
                .cornerRadius(4)
                .overlay(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.red, lineWidth: 2)
                            .opacity(viewModel.invalidCredentials ? 1 : 0))

                if viewModel.invalidCredentials {
                    Text("Credenciais incorretas")
                        .foregroundColor(.red)
                        .font(.footnote)
                        .frame(minWidth: 0,
                               idealWidth: .infinity,
                               maxWidth: .infinity,
                               alignment: .trailing)
                }
                
                Button(action: {
                    hideKeyboard()
                    viewModel.login()
                }) {
                    Text("ENTRAR")
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 0,
                               maxHeight: 50,
                               alignment: .center)
                        .background(Color("pink"))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold, design: .default))
                }
                .padding(.vertical)
            }
            .offset(y: -CGFloat(viewModel.offsetValue))
            .padding(.horizontal)
            .animation(.default)

            Spacer()
        }
        .overlay(
            Color.black.opacity(0.6)
                .overlay(LoaderView())
                .opacity(viewModel.isLoading ? 1 : 0)
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillShowNotification,
                object: nil,
                queue: .main
            ){ (notification) in
                withAnimation() {
                    viewModel.isEditing = true
                    viewModel.offsetValue = 90
                }
            }

            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillHideNotification,
                object: nil,
                queue: .main
            ){ (notification) in
                withAnimation() {
                    viewModel.isEditing = false
                    viewModel.offsetValue = 0
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct TopShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.size.width, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.size.height),
                          control: CGPoint(x: rect.size.width/2, y: rect.size.height * 1.3))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()

        return path
    }
}
