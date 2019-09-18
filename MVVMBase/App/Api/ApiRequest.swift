//
//  ApiRequest.swift
//  B+Com U
//
//  Created by Ha Nguyen Thai on 5/20/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation
import Alamofire
import Foundation

class ApiRequest: URLRequestConvertible {
    
    let method:String
    let path:String
    let params:[String: Any]?
    
    init(method: String, path: String) {
        self.method = method
        self.path   = path
        self.params = nil
    }
    
    init(method: String, path: String, params: [String: Any]?) {
        self.method = method
        self.path   = path
        self.params = params
    }
    
    var url: String {
        return base_url + path
    }
    
    /// Returns a URL request or throws if an `Error` was encountered.
    ///
    /// - throws: An `Error` if the underlying `URLRequest` is `nil`.
    ///
    /// - returns: A URL request.
    public func asURLRequest() throws -> URLRequest {
        let url = URL(string: self.url.urlEncoding)!
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.timeoutInterval = 15
        _ = request.allHTTPHeaderFields?.updateValue(TimeZone.autoupdatingCurrent.identifier, forKey: "Time-Zone")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        if let language = Bundle.main.preferredLocalizations.first {
            _ = request.allHTTPHeaderFields?.updateValue(language[0...1], forKey: "Accept-Language")
        }
        
        if let header = CacheManager.getApiToken() {
            request.setValue("Bearer \(String(describing: header))", forHTTPHeaderField: "Authorization")
        }
        return try Alamofire.JSONEncoding().encode(request, with: params)
        
    }
    
}
