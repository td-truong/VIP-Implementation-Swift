//
//  UserListPresenterTests.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Duy Truong on 11/08/2021.
//

import XCTest
@testable import VIP_Implementation_Swift

class UserListPresenterTests: XCTestCase {

    var mockController: MockUserListController!
    var sut: UserListPresenter!
    
    override func setUp() {
        super.setUp()
        mockController = MockUserListController()
        sut = UserListPresenter()
        sut.view = mockController
    }
    
    override func tearDown() {
        mockController = nil
        sut = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_viewShowLoading() {
        sut.viewDidLoad()
        
        XCTAssert(mockController.isLoading == true)
    }
    
    func test_givenUsers_didGetUsers_viewCallsShowLoadingAndRefresh() {
        let expectedUsers = [
            User(name: "John", email: "example@somemail.com")
        ]
        let expectedCellViewModels = expectedUsers.map {
            UserCellViewModel(nameText: $0.name, emailText: "✉️ \($0.email ?? "")")
        }
        sut.didGetUsers(expectedUsers)
        
        XCTAssert(mockController.isLoading == false)
        XCTAssertEqual(mockController.refreshCalledNumber, 1)
        XCTAssertEqual(mockController.cellViewModels, expectedCellViewModels)
    }
    
    func test_givenError_didGetError_viewCallsHideLoadingAndShowError() {
        let expectedError = CustomError.default
        sut.didGetError(expectedError)
        
        XCTAssert(mockController.isLoading == false)
        XCTAssertEqual(mockController.errorTitle, expectedError.localizedDescription)
    }

}
