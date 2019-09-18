//
//  User.swift
//  MVVMBase
//
//  Created by Ha Nguyen Thai on 6/20/19.
//  Copyright © 2019 Ace. All rights reserved.
//

import Foundation

//
//  User.swift
//  B+Com U
//
//  Created by Ha Nguyen Thai on 5/21/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation

protocol UpdateUserInfo {
    var id : String { get }
}

class Token: UpdateUserInfo {
    var id: String = ""
    var api_token = ""
    var expires_at = ""
}

class User: UpdateUserInfo {
    var id: String = ""
    var name = ""
}

class Participant: UpdateUserInfo {
    var id = ""
    var name = ""
    var latestJoinRoomTime = ""
    var avatar = ""
}

class ParticipantList : NSObject {
    var participants : [Participant] = []
}

