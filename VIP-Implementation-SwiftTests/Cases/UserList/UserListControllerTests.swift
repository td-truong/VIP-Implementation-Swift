//
//  UserListControllerTests.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Duy Truong on 11/08/2021.
//

import XCTest
@testable import VIP_Implementation_Swift

class UserListControllerTests: XCTestCase {
    
    var mockInteractor: MockUserListInteractor!
    var mockRouter: MockUserListRouter!
    var sut: UserListController!
    
    override func setUp() {
        super.setUp()
        mockInteractor = MockUserListInteractor()
        mockRouter = MockUserListRouter()
        sut = UserListController(interactor: mockInteractor, router: mockRouter)
    }
    
    override func tearDown() {
        mockInteractor = nil
        mockRouter = nil
        sut = nil
        super.tearDown()
    }

    func test_whenViewDidLoad_interactorCallsViewDidLoad() {
        _ = sut.view // Trigger viewDidLoad
        
        XCTAssertEqual(mockInteractor.viewDidLoadCalledNumber, 1)
    }

}
