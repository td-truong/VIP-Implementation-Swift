//
//  MockUserRepository.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Machintosh on 11/08/2021.
//

import Foundation
@testable import VIP_Implementation_Swift

class MockUserRepository: UserRepositoryProtocol {
        
    let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    var getUsersCalledNumber = 0
    
    func getUsers(completion: @escaping ([User]?, Error?) -> Void) -> URLSessionDataTask {
        getUsersCalledNumber += 1
        return URLSessionDataTask()
    }
    
}
