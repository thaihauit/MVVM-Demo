//
//  RegisterUserRestApi.swift
//  B+Com U
//
//  Created by Ha Nguyen Thai on 5/21/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation

class UserRestApi: BaseRestApi {
    
    static let shared = UserRestApi()
    
    func authenticationToken( _ completion: @escaping (Response) -> Void) {
        var params = Dictionary<String, String>()
        let userId = CacheManager.getCurrentUserId()
        params["user_id"] = userId
        return callInBackgroundWithRequest(createPOSTRequest(apiSuffix: "login", params: params), parser: TokenParser.sharedInstance, completion)
    }
    
    func saveNewUser (_ userName: String, _ completion: @escaping (Response) -> Void) {
        var params = Dictionary<String, String>()
        //let fcmToken = CacheManager.getFcmToken()
        params["user_name"] = userName
        params["fcm_token"] = "123456464654654"
        return callInBackgroundWithRequest(createPOSTRequest(apiSuffix: "save-user", params: params), parser: UserParser.sharedInstance, completion)
    }
    
    func deleteUserAvatar(_ completion: @escaping (Response) -> Void) {
        var params = Dictionary<String, String>()
        let userId = CacheManager.getCurrentUserId()
        params["user_id"] = userId
        return callInBackgroundWithRequest(createDELETERequest(apiSuffix: "delete-avatar", params: params), completion)
    }
    
}
