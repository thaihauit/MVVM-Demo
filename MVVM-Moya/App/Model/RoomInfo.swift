//
//  RoomInfo.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 3/15/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import UIKit

struct RoomInfo {
    var userCreatorId = ""
    var userId = ""
    var roomImage = ""
    var roomId = ""
    var createdAt = ""
    var updatedAt = ""
    var roomName = ""
    var localImage : UIImage?
}

extension RoomInfo: Decodable {

    enum DataKey: String, CodingKey {
        case data
    }

    enum RoomInfoCodingKey: String, CodingKey {
        case userCreatorId = "room_owner_id"
        case userId = "user_id"
        case roomImage = "room_image"
        case roomId = "room_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case roomName = "room_name"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DataKey.self)
        let detailContainer = try container.nestedContainer(keyedBy: RoomInfoCodingKey.self, forKey: .data)
        userCreatorId = try detailContainer.decode(String.self, forKey: .userCreatorId)
        userId = try detailContainer.decode(String.self, forKey: .userId)
        roomImage = try detailContainer.decode(String.self, forKey: .roomImage)
        roomId = try detailContainer.decode(String.self, forKey: .roomId)
        createdAt = try detailContainer.decode(String.self, forKey: .createdAt)
        updatedAt = try detailContainer.decode(String.self, forKey: .updatedAt)
        roomName = try detailContainer.decode(String.self, forKey: .roomName)
    }
}
