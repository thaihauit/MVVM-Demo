//
//  Participant.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 3/15/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation

struct Participant {
    var id = ""
    var name = ""
    var latestJoinRoomTime = ""
    var avatar = ""
}

struct ParticipantList  {
    var participants : [Participant] = []
}

