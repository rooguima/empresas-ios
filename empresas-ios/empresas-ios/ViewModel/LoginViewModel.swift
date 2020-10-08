//
//  LoginViewModel.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 06/10/20.
//

import Foundation

class LoginViewModel: ObservableObject {
//    @Published var user: UserLogin = UserLogin()

    var email: String = "" {
        didSet {
            invalidCredentials = false
            objectWillChange.send()
        }
    }
    var password: String = "" {
        didSet {
            invalidCredentials = false
            objectWillChange.send()
        }
    }

    @Published var isLoading = false
    @Published var invalidCredentials = false
    @Published var isEditing: Bool = false
    @Published var isSecure: Bool = true
    @Published var offsetValue = 0

    func login() {
        let userLogin = UserLogin(email: email, password: password)

        isLoading = true

        API().postSignIn(userLogin, completion: { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(_):
                        UserDefaults.standard.set(true, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    case .failure(_):
                        self.invalidCredentials = true
                }
                self.isLoading = false
            }
        })
    }
}
