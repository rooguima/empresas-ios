//
//  Enterprise.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 06/10/20.
//

import Foundation

struct Enterprises: Codable {
    let enterprises: [Enterprise]
}

struct Enterprise: Codable, Identifiable {
    let id: Int?
    let email_enterprise: String?
    let facebook: String?
    let twitter: String?
    let linkedin: String?
    let phone: String?
    let own_enterprise: Bool?
    let enterprise_name: String?
    let photo: String?
    let description: String?
    let city: String?
    let country: String?
    let value: Int?
    let share_price: Int?
    let enterprise_type: EnterpriseType?
}

struct EnterpriseType: Codable {
    let id: Int?
    let enterprise_type_name: String?
}
