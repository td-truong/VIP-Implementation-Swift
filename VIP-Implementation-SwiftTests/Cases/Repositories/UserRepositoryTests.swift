//
//  UserRepositoryTests.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Machintosh on 12/08/2021.
//

import XCTest
@testable import VIP_Implementation_Swift

class UserRepositoryTests: XCTestCase {
    
    var mockSession: MockURLSession!
    var sut: UserRepository!
    
    let expectedGetUsersURL = URL(string: "users", relativeTo: Endpoints.baseURL)!
    
    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        sut = UserRepository(session: mockSession)
    }
    
    override func tearDown() {
        mockSession = nil
        sut = nil
        super.tearDown()
    }
    
    func test_getUsers_callsExpectedURL() {
        let dataTask = sut.getUsers { _, _ in } as! MockURLSessionDataTask
        
        XCTAssertEqual(dataTask.url, expectedGetUsersURL)
    }
    
    func test_getUsers_dataTaskCallsResume() {
        let dataTask = sut.getUsers { _, _ in } as! MockURLSessionDataTask
        
        XCTAssertEqual(dataTask.resumeCalledNumber, 1)
    }
    
    func test_getUsers_givenStatusCode500_callsCompletion() {
        let givenResponse = HTTPURLResponse(url: expectedGetUsersURL, statusCode: 500, httpVersion: nil, headerFields: nil)
        
        var calledCompletion = false
        var receivedUsers: [User]?
        var receivedError: Error?
        
        let dataTask = sut.getUsers { users, error in
            calledCompletion = true
            receivedUsers = users
            receivedError = error
        } as! MockURLSessionDataTask
        
        dataTask.completionHandler(nil, givenResponse, nil)
        
        XCTAssert(calledCompletion)
        XCTAssertNil(receivedUsers)
        XCTAssertNil(receivedError)
    }
    
    // Test given error, given valid data, given invalid data to complete user repository
    
}
