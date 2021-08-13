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
    var sut: UserListInteractor!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockUserListPresenter()
        sut = UserListInteractor(presenter: mockPresenter)
    }
    
    override func tearDown() {
        mockPresenter = nil
        sut = nil
        super.tearDown()
    }
    
    func test_whenInteractorCalledViewDidLoad_presenterCallsViewDidLoad() {
        sut.viewDidLoad()
        
        XCTAssertEqual(mockPresenter.viewDidLoadCalledNumber, 1)
    }

}
