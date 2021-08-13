//
//  MockUserListPresenter.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Machintosh on 11/08/2021.
//

@testable import VIP_Implementation_Swift

class MockUserListPresenter: UserListPresenterProtocol {
    
    var view: UserListViewProtocol?
    
    var viewDidLoadCalledNumber = 0
    var receivedUsers: [User]?
    var receivedError: Error?
    
    func viewDidLoad() {
        viewDidLoadCalledNumber += 1
    }
    
    func didGetUsers(_ users: [User]) {
        receivedUsers = users
    }
    
    func didGetError(_ error: Error) {
        receivedError = error
    }
    
}
