//
//  MockUserListPresenter.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Machintosh on 11/08/2021.
//

import UIKit
@testable import VIP_Implementation_Swift

class MockUserListPresenter: UserListPresenterProtocol {
    
    var view: UserListViewProtocol?
    
    var viewDidLoadCalledNumber = 0
    
    func viewDidLoad() {
        viewDidLoadCalledNumber += 1
    }
    
}
