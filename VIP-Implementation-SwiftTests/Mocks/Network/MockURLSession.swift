//
//  MockURLSession.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Duy Truong on 11/08/2021.
//

import Foundation
@testable import VIP_Implementation_Swift

class MockURLSession: URLSessionProtocol {
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask(url: url, completionHandler: completionHandler)
    }

}
