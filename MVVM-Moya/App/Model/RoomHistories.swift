//
//  RoomHistories.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 3/15/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation

class RoomHistories: NSObject {
    var currentPage = 0
    var totalResult = 0
    var totalPage = 0
    var roomList: [RoomHistory] = []
}
