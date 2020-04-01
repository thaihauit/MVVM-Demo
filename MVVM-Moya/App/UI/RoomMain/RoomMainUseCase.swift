//
//  RoomMainUseCase.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/24/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation

protocol RoomMainUseCaseType {
    func validate(username: String) -> Bool
    func loadindValidate(user: User) -> Bool
    
}

struct RoomMainUseCase: RoomMainUseCaseType {
    func validate(username: String) -> Bool {
        return true
    }
    
    func loadindValidate(user: User) -> Bool {
        return true
    }
    
    
}
