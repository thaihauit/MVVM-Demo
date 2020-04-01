//
//  LoginMagager.swift
//  VIPER
//
//  Created by Ha Nguyen Thai on 9/30/19.
//  Copyright © 2019 Ace. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa

protocol Loginable {
    func createToken(id : String) -> Driver<Token>
    func registerUser(name: String, token: String) -> Driver<User>
    func registerUser1(name: String, token: String) -> Observable<User>
}

struct LoginProvider: Loginable, Restable {
    var provider = MoyaProvider<LoginApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func createToken(id : String) -> Driver<Token> {
        let token = Token(token: "", expires_at: "")
        return provider.rx.request(LoginApi.createToken(id: id)).debug().map(Token.self).asDriver(onErrorJustReturn: token)
    }
    
    func registerUser(name: String, token: String) -> Driver<User> {
        let user = User(user_id: "ko co", user_name: "ko co")
        return provider.rx.request(LoginApi.registerUser(name: name, token: token)).debug().map(User.self).asDriver(onErrorJustReturn: user)
    }
    
    func registerUser1(name: String, token: String) -> Observable<User> {
        return provider.rx.request(LoginApi.registerUser(name: name, token: token)).debug().map(User.self).asObservable()
    }

}

