//
//  ApiResponse.swift
//  B+Com U
//
//  Created by Ha Nguyen Thai on 5/20/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation

protocol Response {
    var result: Any? {get}
    var statusCode: Int { get }
    var message: String { get }
    var data: Any? { get }
}

class ApiSuccess: Response {
    var result: Any?
    var statusCode: Int = -1
    var message = ""
    var data: Any?
    
    init(result: Any?, message: String, statusCode: Int) {
        self.result = result
        self.message = message
        self.statusCode = statusCode
    }
}

class ApiError: Response {
    var result: Any? = nil
    var data: Any? = nil
    var statusCode: Int = -1
    var message = ""
   
    init(message: String, statusCode: Int) {
        self.message = message
        self.statusCode = statusCode
    }
}
