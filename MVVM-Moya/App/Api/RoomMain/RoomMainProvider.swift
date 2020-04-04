//
//  RoomMainProvider.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 3/14/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Foundation
import Moya
import RxSwift
import RxCocoa

protocol RoomMainable {
    func getRoomInfo(id : String) -> Driver<RoomInfo>
    func joinRoom(id: String) -> Driver<RoomInfo>
    func exitRoom(id: String) -> Driver<BaseData>
    //func getParticipantList(id: String) -> Driver<User>
}

struct RoomMainProvider: RoomMainable, Restable {
    var provider = MoyaProvider<RoomMainApi>(plugins: [])
    
    func getRoomInfo(id: String) -> Driver<RoomInfo> {
        let roomInfo = RoomInfo(userCreatorId: "", userId: "", roomImage: "", roomId: "", createdAt: "", updatedAt: "", roomName: "", localImage: nil)
        return provider.rx.request(RoomMainApi.getRoomInfo(id: id)).debug().map(RoomInfo.self).asDriver(onErrorJustReturn: roomInfo)
    }
    
    func joinRoom(id: String) -> Driver<RoomInfo> {
        let roomInfo = RoomInfo(userCreatorId: "", userId: "", roomImage: "", roomId: "", createdAt: "", updatedAt: "", roomName: "", localImage: nil)
        return provider.rx.request(RoomMainApi.joinRoom(id: id)).debug().map(RoomInfo.self).asDriver(onErrorJustReturn: roomInfo)
    }
    
    func exitRoom(id: String) -> Driver<BaseData> {
        let message = BaseData(message: "loi cmnr")
        return provider.rx.request(RoomMainApi.exitRoom(id: id)).debug().map(BaseData.self).asDriver(onErrorJustReturn: message)
    }
    
//    func getParticipantList(id: String) -> Driver<User> {
//
//    }
    
    
    
    

}
