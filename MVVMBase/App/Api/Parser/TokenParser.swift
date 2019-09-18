//
//  TokenParser.swift
//  B+Com U
//
//  Created by Ha Nguyen Thai on 6/5/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation

class TokenParser: BaseResponseObjectParser <Token> {
    
    static let sharedInstance = TokenParser()
    
    override func parseObject(_ objData: Dictionary<String, AnyObject>) -> Token {
        let token = Token()
        token.api_token = objData.parseStringForKey(forKey: "access_token")
        token.expires_at = objData.parseStringForKey(forKey: "expires_at")
        CacheManager.saveExpireTime(value: Int64(token.expires_at.timeInterval))
        CacheManager.saveApiToken(value: token.api_token)
        return token
    }
}
