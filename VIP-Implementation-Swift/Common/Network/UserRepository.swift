//
//  UserRepository.swift
//  VIP-Implementation-Swift
//
//  Created by Machintosh on 11/08/2021.
//

import Foundation

protocol UserRepositoryProtocol {
    var session: URLSessionProtocol { get }
    
    @discardableResult
    func getUsers(completion: @escaping ([User]?, Error?) -> Void) -> URLSessionDataTask
}

class UserRepository: UserRepositoryProtocol {
    
    let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func getUsers(completion: @escaping ([User]?, Error?) -> Void) -> URLSessionDataTask {
        let usersURL = URL(string: "users", relativeTo: Endpoints.baseURL)!
        let dataTask = session.dataTask(with: usersURL) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  error == nil,
                  let data = data else {
                completion(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let users = try decoder.decode([User].self, from: data)
                completion(users, nil)
            } catch {
                completion(nil, error)
            }
        }
        dataTask.resume()
        return dataTask
    }
    
}
