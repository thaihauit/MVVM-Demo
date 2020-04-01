//
//  ValdationResult.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/20/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation

public enum ValidationResult {
    
    case valid
    
    case invalid([ValidationError])
    
    public var isValid: Bool {
        
        return self == .valid
    }
}

extension ValidationResult: Equatable {
    
    public static func == (lhs: ValidationResult, rhs: ValidationResult) -> Bool {
        
        switch (lhs, rhs) {
       
        case (.valid, .valid):
            return true
        
        case (.invalid(let a), .invalid(let b)):
            return a.map({ $0.message }).joined() == b.map({ $0.message }).joined()
        
        default:
            return false
        }
    }
}

public protocol ValidationError: Error {
    
    var message: String { get }
}
