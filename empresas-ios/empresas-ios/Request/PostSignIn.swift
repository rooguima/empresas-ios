//
//  PostSignIn.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 06/10/20.
//

import Foundation

extension API {
    func postSignIn(_ messageToSave: UserLogin, completion: @escaping(Result<User, APIError>) -> Void) {
        let endpoint = "users/auth/sign_in"

        do {
            let resourceURL = getApiURL(for: endpoint)

            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(messageToSave)

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }

                do {
                    let messageData = try JSONDecoder().decode(User.self, from: jsonData)

                    UserDefaults.standard.setValue(httpResponse.value(forHTTPHeaderField: "access-token")!, forKey: "access-token")
                    UserDefaults.standard.setValue(httpResponse.value(forHTTPHeaderField: "client")!, forKey: "client")
                    UserDefaults.standard.setValue(httpResponse.value(forHTTPHeaderField: "uid")!, forKey: "uid")

                    completion(.success(messageData))
                }catch{
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encodingProblem))
        }
    }
}
