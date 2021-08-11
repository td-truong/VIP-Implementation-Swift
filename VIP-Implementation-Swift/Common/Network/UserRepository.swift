//
//  UserRepository.swift
//  VIP-Implementation-Swift
//
//  Created by Machintosh on 11/08/2021.
//

import Foundation

protocol UserRepositoryProtocol {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
}

class UserRepository: UserRepositoryProtocol {
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        
    }
    
}
