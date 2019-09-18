//
//  AppConfig.swift
//  B+Com U
//
//  Created by Ha Nguyen Thai on 5/22/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation
import UIKit

let base_url = "http://s064.cloud9-solutions.com/"
let apiPrefix = "api/"

class AppConfig: NSObject {
    
    static func getUuidDevice() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    static var currentTimeInSeconds: Int {
        return Int(Date().timeIntervalSince1970)
    }
    
    static func setup() {
        ThreadManager.asyncGlobalQueueWith(.background) {
            self.setCurrentUserId()
            guard !isAvaiableToken() else {
                return
            }
            
            self.generateToken(nil)
        }
    }
    
    static func generateToken(_ completion: SuccessCompletion?) {
        UserRestApi.shared.authenticationToken { (response) in
            guard response.statusCode == 200 else {
                print(response.message)
                completion?(false)
                return
            }
            print(response.message)
            completion?(true)
        }
    }
    
    static func setCurrentUserId() {
        let id = CacheManager.getCurrentUserId()
        if id != getUuidDevice() {
            CacheManager.saveCurrentUserId(value: getUuidDevice()!)
        }
    }
    
    static func isAvaiableToken() -> Bool {
        let apiToken = CacheManager.getApiToken()
        return apiToken != nil && apiToken != ""
    }
}

