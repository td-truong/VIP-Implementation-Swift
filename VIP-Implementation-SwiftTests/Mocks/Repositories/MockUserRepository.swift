//
//  MockUserRepository.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Machintosh on 11/08/2021.
//

import Foundation
@testable import VIP_Implementation_Swift

class MockUserRepository: UserRepositoryProtocol {
    
    var getUsersCalledNumber = 0
    
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        getUsersCalledNumber += 1
    }
    
}
