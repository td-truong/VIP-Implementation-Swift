//
//  UserListInteractorTests.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Duy Truong on 11/08/2021.
//

import XCTest
@testable import VIP_Implementation_Swift

class UserListInteractorTests: XCTestCase {

    var mockPresenter: MockUserListPresenter!
    var mockSession: MockURLSession!
    var mockRepository: MockUserRepository!
    var sut: UserListInteractor!
    
    override func setUp() {
        super.setUp()
        mockPresenter = MockUserListPresenter()
        mockSession = MockURLSession()
        mockRepository = MockUserRepository(session: mockSession)
        sut = UserListInteractor(presenter: mockPresenter, repository: mockRepository)
    }
    
    override func tearDown() {
        mockPresenter = nil
        mockSession = nil
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
    
    func test_whenInteractorCalledGetUsers_repositoryCallsGetUsers() {
        sut.getUsers()
        
        XCTAssertEqual(mockRepository.getUsersCalledNumber, 1)
    }
    
    func test_givenUsers_whenInteractorGetUsersSuccess_presenterCallsDidGetUsers() {
        let expectedUsers = [
            User(name: "John", email: "abcdef@somemail.com")
        ] // or from valid JSON
        sut.getUsers()
        
        mockRepository.getUsersCompletion?(expectedUsers, nil)
        
        XCTAssertEqual(mockPresenter.receivedUsers, expectedUsers)
    }
    
    func test_givenError_whenInteractorGetUsersFailed_presenterCallsDidGetError() throws {
        let expectedError = NSError(domain: "com.example", code: 422, userInfo: nil)
        sut.getUsers()
        
        mockRepository.getUsersCompletion?(nil, expectedError)
        
        let receivedError = try XCTUnwrap(mockPresenter.receivedError as NSError?)
        XCTAssertEqual(receivedError, expectedError)
    }

}
