//
//  GetEnterprises.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 08/10/20.
//

import Foundation

extension API {
    func getEnterprises(search: String, completion: @escaping(Result<Enterprises, APIError>) -> Void) {
        let endpoint = "enterprises"

        do {
            let resourceURL = getApiURL(for: endpoint)
            
            var components = URLComponents(url: resourceURL, resolvingAgainstBaseURL: false)
            components?.queryItems = [
                URLQueryItem(name: "name", value: search)
            ]
            
            var urlRequest = URLRequest(url: components!.url!)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue(UserDefaults.standard.string(forKey: "access-token")!, forHTTPHeaderField: "access-token")
            urlRequest.addValue(UserDefaults.standard.string(forKey: "client")!, forHTTPHeaderField: "client")
            urlRequest.addValue(UserDefaults.standard.string(forKey: "uid")!, forHTTPHeaderField: "uid")

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }

                do {
                    let messageData = try JSONDecoder().decode(Enterprises.self, from: jsonData)

                    completion(.success(messageData))
                }catch{
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        }
    }
}
