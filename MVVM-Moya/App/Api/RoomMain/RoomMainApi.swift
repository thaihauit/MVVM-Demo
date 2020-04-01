//
//  RoomMainApi.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 3/14/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Moya

enum RoomMainUri: String {
    case getRoomInnfo = "getRoomInnfo"
    case joinRoom = "joinRoom"
    case exitRoom = "exitRoom"
    case getParticipantList = "getParticipantList"
    
    var path: String {
        switch self {
        case .getRoomInnfo:
            return "room-info"
        case .joinRoom:
            return "room-join"
        case .exitRoom:
            return "room-exit"
        case .getParticipantList:
            return "list-user"
        }
    }
}

enum RoomMainApi {
    case getRoomInfo(id: String)
    case joinRoom(id: String)
    case exitRoom(id: String)
    case getParticipantList(id: String)
}

extension RoomMainApi: TargetType {
    var headers: [String : String]? {
        switch self {
        case .getRoomInfo(_), .joinRoom(_), .exitRoom(_), .getParticipantList(_):
            return ["Authorization": "Bearer \(String(describing: CacheManager.init().getApiToken()))",
                "Content-Type": "application/json"
            ]
        }
    }
    
    var baseURL: URL {
        return URL(string: AppConfig.sharedInstance.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getRoomInfo(_):
            return RoomMainUri.getRoomInnfo.path
        case .joinRoom(_):
            return RoomMainUri.joinRoom.path
        case .exitRoom(_):
            return RoomMainUri.exitRoom.path
        case .getParticipantList(_):
            return RoomMainUri.getParticipantList.path
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRoomInfo(_), .getParticipantList(_):
            return .get
        case .joinRoom(_), .exitRoom(_):
            return .post
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .getRoomInfo(let id):
            let params: [String: Any] = ["room_id": id]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
            
        case .joinRoom(let id):
            return .requestParameters(parameters: ["room_id": id, "user_id": CacheManager.shared.getCurrentUserId() ?? ""], encoding: JSONEncoding.default)
            
        case .exitRoom(let id):
            return .requestParameters(parameters: ["room_id": id, "user_id": CacheManager.shared.getCurrentUserId() ?? ""], encoding: JSONEncoding.default)
        case .getParticipantList(let id):
            return .requestParameters(parameters: ["room_id": id, "user_id": CacheManager.shared.getCurrentUserId() ?? ""], encoding: JSONEncoding.default)
        }
    }
}


