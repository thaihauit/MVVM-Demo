//
//  LoginUseCase.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/20/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol LoginUseCaseType {
    func validate(username: String) -> Bool
    func loadindValidate(user: User) -> Bool
    func saveCurrenltUser(user: User)
}

struct LoginUseCase: LoginUseCaseType {
    func validate(username: String) -> Bool {
        return username.length > 0
    }
    
    func loadindValidate(user: User) -> Bool {
        return !user.user_name.isEmpty
    }
    
    func saveCurrenltUser(user: User) {
        CacheManager.shared.saveUserName(value: user.user_name)
    }
    
}
