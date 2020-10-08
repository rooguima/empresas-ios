//
//  Investor.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 06/10/20.
//

import Foundation

struct UserLogin: Codable {
    let email: String
    var password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

struct User: Codable {
    let investor: Investor?
    let enterprise: Enterprise?
    let success: Bool?
}

struct Investor: Codable {
    let id: Int
    let investor_name: String
    let email: String
    let city: String
    let country: String
    let balance: Int
    let photo: String?
    let portfolio: Portfolio
    let portfolio_value: Int
    let first_access: Bool
    let super_angel: Bool
}

struct Portfolio: Codable {
    let enterprises_number: Int
    let enterprises: [Enterprise]
}
