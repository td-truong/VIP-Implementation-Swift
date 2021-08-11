//
//  UserListInteractorTests.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Machintosh on 11/08/2021.
//

import XCTest
@testable import VIP_Implementation_Swift

class UserListInteractorTests: XCTestCase {

    var mockPresenter: MockUserListPresenter!
    var mockRepository: MockUserRepository!
    var sut: UserListInteractor!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockUserListPresenter()
        mockRepository = MockUserRepository()
        sut = UserListInteractor(presenter: mockPresenter, repository: mockRepository)
    }
    
    override func tearDown() {
        mockPresenter = nil
        mockRepository = nil
        sut = nil
        super.tearDown()
    }
    
    func test_whenInteractorCalledViewDidLoad_presenterCallsViewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertEqual(mockPresenter.viewDidLoadCalledNumber, 1)
    }
    
    func test_whenInteractorCalledViewDidLoad_repositoryCallsGetUsers() {
        sut.viewDidLoad()
        
        XCTAssertEqual(mockRepository.getUsersCalledNumber, 1)
    }

}
