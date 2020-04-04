//
//  AppUseCase.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/25/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol AppUseCaseType {
    func isTokenValid(object: Driver<String>) -> Driver<Bool>
    func isDeviceIdValid(object: Driver<String>) -> Driver<Bool>
}

struct AppUseCase: AppUseCaseType {
    func isTokenValid(object: Driver<String>) -> Driver<Bool> {
        return object.map { token in
            token.count > 0
        }
    }
    
    func isDeviceIdValid(object: Driver<String>) -> Driver<Bool> {
        return object.map { token in
            token.count > 0
        }
    }
    
}
