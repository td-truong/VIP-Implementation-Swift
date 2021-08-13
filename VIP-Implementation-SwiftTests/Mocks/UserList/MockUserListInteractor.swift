//
//  MockUserListInteractor.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Machintosh on 11/08/2021.
//

@testable import VIP_Implementation_Swift

class MockUserListInteractor: UserListInteractorProtocol {
    
    var presenter: UserListPresenterProtocol = UserListPresenter()
    
    var viewDidLoadCalledNumber = 0
    
    func viewDidLoad() {
        viewDidLoadCalledNumber += 1
    }
    
}
