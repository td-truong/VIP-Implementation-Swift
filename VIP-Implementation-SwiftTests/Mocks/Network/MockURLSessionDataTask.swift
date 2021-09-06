//
//  MockURLSessionDataTask.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Duy Truong on 11/08/2021.
//

import Foundation
@testable import VIP_Implementation_Swift

class MockURLSessionDataTask: URLSessionDataTask {
    
    var url: URL
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
    
    var resumeCalledNumber = 0
    
    init(url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.url = url
        self.completionHandler = completionHandler
        super.init()
    }
    
    override func resume() {
        resumeCalledNumber += 1
    }
    
}
