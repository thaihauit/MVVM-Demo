//
//  CacheMannager.swift
//  MVVMBase
//
//  Created by Ha Nguyen Thai on 6/19/19.
//  Copyright © 2019 Ace. All rights reserved.
//


import Foundation

class CacheManager: NSObject {
    
    
    // MARK:- Api token
    class func getApiToken() -> String? {
        return UserDefaults.standard.string(forKey: "api_token")
    }
    
    class func saveApiToken(value: String) {
        UserDefaults.standard.set(value, forKey: "api_token")
        UserDefaults.standard.synchronize()
    }
    
    class func removeApiToken() {
        UserDefaults.standard.removeObject(forKey: "api_token")
    }
    
    class func getExpireTime() -> Int? {
        return UserDefaults.standard.integer(forKey: "expire_time")
    }
    
    class func saveExpireTime(value: Int64) {
        UserDefaults.standard.set(value, forKey: "expire_time")
        UserDefaults.standard.synchronize()
    }
    
    // MARK:- Fcm token
    class func getFcmToken() -> String? {
        return UserDefaults.standard.string(forKey: "fcm_token")
    }
    
    class func saveFcmToken(value: String) {
        UserDefaults.standard.set(value, forKey: "fcm_token")
        UserDefaults.standard.synchronize()
    }
    
    // MARK:- User Id
    class func getCurrentUserId() -> String? {
        return UserDefaults.standard.string(forKey: "user_id")
    }
    
    class func saveCurrentUserId(value: String) {
        UserDefaults.standard.set(value, forKey: "user_id")
        UserDefaults.standard.synchronize()
    }
    
    // MARK:- User name
    class func getCurrentUserName() -> String? {
        return UserDefaults.standard.string(forKey: "user_name")
    }
    
    class func saveCurrentUserName(value: String) {
        UserDefaults.standard.set(value, forKey: "user_name")
        UserDefaults.standard.synchronize()
    }
    
    //MARK:- Lte users
    class func saveLteUsers(values: [String]) {
        UserDefaults.standard.set(values, forKey: "lte_users")
        UserDefaults.standard.synchronize()
    }
    
    class func getLteUsers() -> [String]? {
        return UserDefaults.standard.stringArray(forKey: "lte_users")
    }
    
    //MARK:- Lte room
    class func getCurrentRoomId() -> String? {
        return UserDefaults.standard.string(forKey: "room_id")
    }
    
    class func saveCurrentRoomId(value: String?) {
        UserDefaults.standard.set(value, forKey: "room_id")
        UserDefaults.standard.synchronize()
    }
    
    class func removeCurrentRoomId() {
        UserDefaults.standard.removeObject(forKey: "room_id")
    }
    
    class func getIsConnected() -> Bool {
        return (UserDefaults.standard.object(forKey: "is_connected") as? Bool) ?? false
    }
    
    class func setIsConnected(connected: Bool) {
        UserDefaults.standard.set(connected, forKey: "is_connected")
        UserDefaults.standard.synchronize()
    }
    
    //MARK:- Screen always on
    
    class func setScreenAlwaysOn(value: Bool) {
        UserDefaults.standard.set(value, forKey: "screen_always_on")
        UserDefaults.standard.synchronize()
    }
    
    class func isScreenAlwaysOn() -> Bool {
        return UserDefaults.standard.bool(forKey: "screen_always_on")
    }
    
}

