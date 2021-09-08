//
//  MockUserRepository.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Duy Truong on 11/08/2021.
//

import Foundation
@testable import VIP_Implementation_Swift

class MockUserRepository: UserRepositoryProtocol {
        
    let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    var getUsersCalledNumber = 0
    var getUsersCompletion: (([User]?, Error?) -> Void)?
    
    func getUsers(completion: @escaping ([User]?, Error?) -> Void) -> URLSessionDataTask {
        getUsersCalledNumber += 1
        getUsersCompletion = completion
        return URLSessionDataTask()
    }
    
}
