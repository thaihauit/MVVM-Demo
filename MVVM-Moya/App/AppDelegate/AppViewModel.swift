//
//  AppViewModel.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/25/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa

struct AppViewModel {
    
    let useCase: AppUseCase
    let loginProvider = LoginProvider()
    let disposeBag = DisposeBag()
    
}

extension AppViewModel: ViewModelType {
    
    struct Input {
        let generateToken: Driver<String>
        let tokenTrigger : Driver<String>
    }
    
    struct Output {
        let hasToken : Driver<Bool>
        let generateTokenSuccess: Driver<Bool>
        let token : Driver<Token>
    }
    
    func transform(_ input: Input) -> Output {
        let validToken = useCase.isTokenValid(object: input.tokenTrigger)
        
        let generateTokenSuccess = BehaviorSubject<Bool>(value: false)
        
        let token = input.generateToken
            .flatMap({ (deviceId) -> Driver<Token> in
                return self.loginProvider.createToken(id: deviceId)
            }).do(onNext: { (token) in
                if !token.token.isEmpty {
                    CacheManager.shared.saveApiToken(value: token.token)
                    generateTokenSuccess.onNext(true)
                }
            })
        
        return Output(hasToken: validToken, generateTokenSuccess: generateTokenSuccess.asDriverOnErrorJustComplete(), token: token)
    }
    
}
