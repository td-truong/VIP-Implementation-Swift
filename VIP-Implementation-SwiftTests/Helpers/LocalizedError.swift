//
//  LocalizedError.swift
//  VIP-Implementation-SwiftTests
//
//  Created by Machintosh on 13/08/2021.
//

import Foundation

enum CustomError: Error {
    case `default`
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .default:
            return NSLocalizedString("This is custom error", comment: "Custom error")
        }
    }
}

