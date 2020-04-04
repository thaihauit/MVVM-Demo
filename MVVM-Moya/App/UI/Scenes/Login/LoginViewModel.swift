//
//  LoginViewModel.swift
//  Madocon
//
//  Created by Tri Nguyen Minh on 10/31/19.
//  Copyright © 2019 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa

struct LoginViewModel {
    let navigator: LoginNavigatorType
    let useCase: LoginUseCaseType
    
    let loginProvider = LoginProvider()
    let roomProvider = RoomMainProvider()
    let disposeBag = DisposeBag()
    
}

// MARK: - ViewModelType
extension LoginViewModel: ViewModelType {
    
    // MARK: - Input Observer
    struct Input {
        let currentlUser : Driver<String>
        let userName : Driver<String>
        let loginDidTap : Driver<Void>
        let roomInfoTrigger: Driver<String>
    }

    // MARK: - Output Obserable
    struct Output {
        let isLoginEnable: Driver<Bool>
        let isLoading : Driver<Bool>
        let userNameValidation: Driver<Bool>
        let login: Driver<User>
        let goRoomMainScreen: Driver<Bool>
        let id : Driver<RoomInfo>
    }
    
    func transform(_ input: LoginViewModel.Input) -> Output {
        
        let userNameValidation = validate(object: input.userName, trigger: input.loginDidTap, validator: useCase.validate(username:)).debug("userNameValidation")
        
        let isLoginEnable = input.currentlUser.map { (name) -> Bool in
            return name.isEmpty ? false: true
        }.do().debug("isLoginEnable")
        
        let activityIndicator = ActivityIndicator()
        let isLoading = activityIndicator.asDriver().debug("isLoading")
        
        let login = input.loginDidTap
            .withLatestFrom(userNameValidation)
            .debounce(0.2)
            .withLatestFrom(input.userName.asDriver())
            .flatMapLatest { (userName) -> Driver<User> in
            return self.loginProvider.registerUser(name: userName, token: "123456")
        }.do(onNext: { (user) in
            self.useCase.saveCurrenltUser(user: user)
        })
        
        let goRoomMainScreen = PublishSubject<Bool>()
        let roomInfo = input.roomInfoTrigger.flatMap { (id) -> Driver<RoomInfo> in
            return self.roomProvider.getRoomInfo(id: id)
        }.do(onNext: { (roomInfo) in
            if !roomInfo.roomId.isEmpty {
                goRoomMainScreen.onNext(true)
            }
        })
        
        return Output(isLoginEnable: isLoginEnable, isLoading: isLoading, userNameValidation: userNameValidation, login: login, goRoomMainScreen: goRoomMainScreen.asDriver(onErrorJustReturn: false), id: roomInfo)
    }

}

//        let isLoginSuccess = loadingValidate(object: loginDidTap, trigger: input.loginDidTap, validator: useCase.loadindValidate)
//
//        var isLoading = input.loginDidTap
//            .map {
//            return true
//        }.do()
    
//        logOutDidTapSubject
//        .map {
//            return true
//        }
//        .bind(to: isLoadingSubject)
//        .disposed(by: disposeBag)
        
//        input.loginDidTap
//            .withLatestFrom(input.userName)
//            .flatMapLatest { userInput in
//                return self.provider.registerUser1(name: userInput, token: "12345678")}
//            .subscribe(onNext: { event in
//                CacheManager.shared.saveUserName(value: event.user_name)
//            })
//            .disposed(by: disposeBag)
