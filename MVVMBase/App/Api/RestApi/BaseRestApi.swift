//
//  BaseResponseObjectParser.swift
//  B+Com U
//
//  Created by Ha Nguyen Thai on 5/20/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation

class BaseRestApi: NSObject {
    
    func callInBackgroundWithRequest<T: Parsable> (_ apiRequest: ApiRequest, parser: T?, _ completion: ((Response) -> Void )?) {
        if parser != nil {
            return callInBackgroundWithRequest(apiRequest, { (response: Response) in
                if let data = response.result as? Dictionary<String, AnyObject> {
                    return parser!.parseInBackground(data, apiResponse: response as? ApiSuccess, completion!)
                } else {
                     completion!(response)
                }
            })
        } else {
            return callInBackgroundWithRequest(apiRequest, completion)
        }
    }
    
    func callInBackgroundWithRequest(_ apiRequest: ApiRequest, _ completion: ((Response) -> Void )?) {
        return ApiClient.sharedInstance.callInBackground(apiRequest, completion)
    }

    func createGETRequest(apiSuffix: String, apiVersion: String? = nil , params: [String: String]? = nil) -> ApiRequest {
        var apiSuffix = apiSuffix
        if params != nil {
            apiSuffix = generateParamsRequest(uri: apiSuffix, params: params!)
        }
        return createApiRequest(method: "GET", path: getPath(apiSuffix: apiSuffix), params: nil)
    }
    
    func createPOSTRequest(apiSuffix: String, apiVersion: String? = nil, params: [String: Any]? = nil) -> ApiRequest {
        return createApiRequest(method: "POST", path: getPath(apiSuffix: apiSuffix), params: params)
    }
    
    func createPUTRequest(apiSuffix: String, apiVersion: String? = nil, params: [String: Any]? = nil) -> ApiRequest {
        return createApiRequest(method: "PUT", path: getPath(apiSuffix: apiSuffix), params: params)
    }
    
    func createDELETERequest(apiSuffix: String, apiVersion: String? = nil, params: [String: Any]? = nil) -> ApiRequest {
        return createApiRequest(method: "DELETE", path: getPath(apiSuffix: apiSuffix), params: params)
    }
    
    fileprivate func createApiRequest(method: String, path: String, params: [String: Any]? = nil) -> ApiRequest {
        if params != nil {
            return ApiRequest(method: method, path: path, params: params)
        } else {
            return ApiRequest(method: method, path: path)
        }
    }
    
    func getPath(apiSuffix: String) -> String {
        return "\(apiPrefix)\(apiSuffix)"
    }
    
    func generateParamsRequest(uri : String, params: [String: String] ) -> String {
        guard var urlComponents = URLComponents(string: uri) else {
            return ""
        }
        
        // Build an array containing the parameters the user specified
        let queryItems = params.map { key, value in URLQueryItem(name: key, value: value)}
        
        // Add these parameters to the URLComponents
        urlComponents.queryItems = queryItems
        
        // And here's your final URL
        guard let url = urlComponents.url else {
            print("Cannot construct URL")
            return ""
        }
        
        return url.absoluteString
    }
    
}
