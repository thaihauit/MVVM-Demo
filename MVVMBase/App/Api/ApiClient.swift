//
//  ApiClient.swift
//  B+Com U
//
//  Created by Ha Nguyen Thai on 5/20/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient: NSObject {
    
    static let sharedInstance = ApiClient()
    func callInBackground(_ request: ApiRequest, _ completion: ((Response) -> Void )?) {
        let queue = DispatchQueue.global(qos: .utility)
        Alamofire.request(request).responseJSON(queue: queue ) { (response: DataResponse<Any>) in
            ThreadManager.mainQueue({
                if let statusCode = response.response?.statusCode, statusCode == 200 {
                    /// Success
                    completion!(self.parseApiResponse(response))
                } else {
                    /// Error
                    completion!(self.parseApiError(response))
                }
            })
        }
    }
    
    // MARK:- Data Response
    func parseApiResponse(_ response: DataResponse<Any>) -> ApiSuccess {
        if let value = response.result.value as? Dictionary<String, AnyObject> {
            let statusCode = parseIntFrom(value["status_code"], defaultValue: response.response!.statusCode)
            let message = parseStringFrom(value["message"], defaultValue: "")
            let data = parseDictFrom(value["data"], defaultValue: [:])
            return ApiSuccess(result: data, message: message, statusCode: statusCode)
        }
        return ApiSuccess(result: nil, message: "message", statusCode: response.response!.statusCode)
    }
    
    func parseApiError(_ response: DataResponse<Any>) -> ApiError {
        if let statusCode = response.response?.statusCode {
            let type: ErrorCode = ErrorCode.get(statusCode)
            return ApiError( message: type.display , statusCode: type.key )
        }
        
        return ApiError( message: ErrorCode.otherError.display , statusCode: 0 )
    }
    
}
