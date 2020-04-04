//
//  RoomHistoryUseCase.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 3/15/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation

protocol RoomHistoryUseCaseType {
    func validate(username: String) -> Bool
    func loadindValidate(user: User) -> Bool
    
}

struct RoomHistoryUseCase: RoomHistoryUseCaseType {
    func validate(username: String) -> Bool {
        return true
    }
    
    func loadindValidate(user: User) -> Bool {
        return true
    }
    
    
}
