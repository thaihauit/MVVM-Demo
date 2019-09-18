//
//  UserModelParser.swift
//  B+Com U
//
//  Created by Ha Nguyen Thai on 5/21/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation

class UserParser: BaseResponseObjectParser <User> {
    static let sharedInstance = UserParser()
    
    override func parseObject(_ objData: Dictionary<String, AnyObject>) -> User {
        let user = User()
        user.id = "nguyenthaiha"
        user.name = objData.parseStringForKey(forKey: "user_name")
        CacheManager.saveCurrentUserName(value: user.name)
        return user
    }
}
