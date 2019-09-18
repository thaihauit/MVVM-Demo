//
//  ErrorCode.swift
//  ErrorCode
//
//  Created by Ha Nguyen Thai on 5/28/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation

enum ErrorCode: Int {
    
    case unauthorizedError = 401
    case otherError = 400
    case authorizationError = 405
    case urlError = 404
    
    var key: Int {
        return self.rawValue
    }
    
    var display: String {
        switch self {
        case .unauthorizedError:
            return "Url is Unauthorized"
        case .authorizationError:
            return "Authorization is error"
        case .urlError:
            return "Url is error"
        case .otherError:
            return "Other error"
        }
    }
    
    static func get(_ key: Int) -> ErrorCode {
        if let type = ErrorCode(rawValue: key) {
            return type
        }
        return ErrorCode.otherError
    }
}
