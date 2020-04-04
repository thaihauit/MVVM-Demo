//
//  CacheMannager.swift
//  MVVMBase
//
//  Created by Ha Nguyen Thai on 6/19/19.
//  Copyright © 2019 Ace. All rights reserved.
//


import Foundation
import Moya
import RxSwift

class CacheManager: NSObject {
    
    private let userDefaults: UserDefaults
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    static let shared = CacheManager()
    private let apiToken = "api_token"
    private let userName = "user_name"
    
    // MARK:- Api token
    func getApiToken1() -> Observable<String?> {
        return userDefaults.rx.observe(String.self, apiToken)
    }
    
    func getApiToken() -> String {
        return userDefaults.string(forKey: apiToken) ?? ""
    }
    
    func saveApiToken(value: String) {
        userDefaults.set(value, forKey: apiToken)
        userDefaults.synchronize()
    }
    
    func removeApiToken() {
        userDefaults.removeObject(forKey: apiToken)
    }
    
    
    func getUserName() -> String {
        return userDefaults.string(forKey: userName) ?? ""
    }
    
    func saveUserName(value: String) {
        userDefaults.set(value, forKey: userName)
        userDefaults.synchronize()
    }
    
    func removeUserName() {
        userDefaults.removeObject(forKey: userName)
    }
    
    //MARK:- Lte current room id
    func getCurrentRoomId() -> String {
        return userDefaults.string(forKey: "room_id") ?? "awdawd"
    }
    
    func saveCurrentRoomId(value: String?) {
        userDefaults.set(value, forKey: "room_id")
        userDefaults.synchronize()
    }
    
    //MARK: Current room is connected
    func getIsConnected() -> Bool {
        return (userDefaults.object(forKey: "is_connected") as? Bool) ?? false
    }
    
    func setIsConnected(connected: Bool) {
        userDefaults.set(connected, forKey: "is_connected")
        userDefaults.synchronize()
    }
    
    // MARK:- User id
    func getCurrentUserId() -> String? {
        return userDefaults.string(forKey: "user_id")
    }
    
    func saveCurrentUserId(value: String) {
        userDefaults.set(value, forKey: "user_id")
        userDefaults.synchronize()
    }
}

