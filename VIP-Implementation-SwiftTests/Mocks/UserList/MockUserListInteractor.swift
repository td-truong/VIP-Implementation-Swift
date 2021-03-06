//
//  MockUserListInteractor.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Duy Truong on 11/08/2021.
//

import Foundation
@testable import VIP_Implementation_Swift

class MockUserListInteractor: UserListInteractorProtocol {
    
    var presenter: UserListPresenterProtocol = MockUserListPresenter()
    var repository: UserRepositoryProtocol = MockUserRepository(session: URLSession.shared)
    
    var viewDidLoadCalledNumber = 0
    
    func viewDidLoad() {
        viewDidLoadCalledNumber += 1
    }
    
    func getUsers() {
        
    }
    
}
