//
//  MockUserListController.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Duy Truong on 13/08/2021.
//

import UIKit
@testable import VIP_Implementation_Swift

class MockUserListController: UserListViewProtocol {
    
    var interactor: UserListInteractorProtocol
    
    var router: UserListRouterProtocol
    
    var cellViewModels: [UserCellViewModel] = []
    var isLoading: Bool?
    var refreshCalledNumber = 0
    var errorTitle: String?
    
    func showLoading() {
        isLoading = true
    }
    
    func hideLoading() {
        isLoading = false
    }
    
    func refresh() {
        refreshCalledNumber += 1
    }
    
    func showError(title: String) {
        errorTitle = title
    }
    
}
