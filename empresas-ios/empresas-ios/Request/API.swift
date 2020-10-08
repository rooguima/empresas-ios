//
//  API.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 06/10/20.
//

import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

class API {
    let baseURL = "https://empresas.ioasys.com.br"
    let apiPath = "api"
    let version = "v1"

    func getApiURL(for endpoint: String) -> URL {
        guard let resourceURL = URL(string: "\(baseURL)/\(apiPath)/\(version)/\(endpoint)") else {fatalError()}
        return resourceURL
    }

    func getImageURL(for image: String) -> URL {
        guard let resourceURL = URL(string: "\(baseURL)\(image)") else {fatalError()}
        return resourceURL
    }
}
