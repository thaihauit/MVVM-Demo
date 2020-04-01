//
//  MainViewModel.swift
//  Madocon
//
//  Created by Ha Nguyen Thai on 10/22/19.
//  Copyright © 2019 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa

struct RoomMainViewModel {
    
    let useCase: RoomMainUseCase
    let provider = LoginProvider()
    let disposeBag = DisposeBag()
    
}

// MARK: - ViewModelType
extension RoomMainViewModel {
    
    // MARK: - Input Observer
    struct Input {
        let roomInfoBtnDidTap : Driver<Void>
        let roomParticipantDidTap: Driver<Void>
        let addButtonDidTap: Driver<Void>
        let roomDetailBtnDidTap: Driver<Void>
        let joinRoomBtnDidTap: Driver<Void>
        let blinkBtnDidTap: Driver<Void>
        let backBtnDidTap: Driver<Void>
        let roomHistoryBtnDidTap: Driver<Void>
        
    }

    // MARK: - Output Obserable
    struct Output {
        let roomName: Driver<String>
        let joinRoomEnable: Driver<Bool>
        let isParticipantMode: Driver<Bool>
    }
    
//    func transform(_ input: Input) -> Output {
//
//
//
//
//    }
}





//class RoomMainViewModel {
//
//
//    // MARK:- Variable Propertive
//    let input : Input
//    let output: Output
//    let disposeBag = DisposeBag()
//
//    // MARK:- Input
//    struct Input {
//
//        // Button action
//        let roomInfoBtnDidTap : AnyObserver<Void>
//        let roomParticipantDidTap: AnyObserver<Void>
//        let addButtonDidTap: AnyObserver<Void>
//        let roomDetailBtnDidTap: AnyObserver<Void>
//        let joinRoomBtnDidTap: AnyObserver<Void>
//        let blinkBtnDidTap: AnyObserver<Void>
//        let backBtnDidTap: AnyObserver<Void>
//        let roomHistoryBtnDidTap: AnyObserver<Void>
//    }
//    let roomInfoSubject = PublishSubject<Void>()
//    let roomParticipantSubject = PublishSubject<Void>()
//    let addSubject = PublishSubject<Void>()
//    let roomDetailSubject = PublishSubject<Void>()
//    let joinRoomSubject = PublishSubject<Void>()
//    let blinkSubject = PublishSubject<Void>()
//    let backSubject = PublishSubject<Void>()
//    let roomHistorySubject = PublishSubject<Void>()
//
//    // MARK:- Output
//    struct Output {
//        let roomName: Observable<String>
//        let joinRoomEnable: Observable<Bool>
//        let isParticipantMode: Observable<Bool>
//    }
//
//    let roomNameSubject = BehaviorSubject<String>(value: "Initial Value")
//    let joinRoomEnableSubject = BehaviorSubject<Bool>(value: true)
//    let isParticipantSubject = BehaviorSubject<Bool>(value: false)
//
//
//
//    init() {
//        input = Input(roomInfoBtnDidTap: roomInfoSubject.asObserver(),
//                      roomParticipantDidTap: roomParticipantSubject.asObserver(),
//                      addButtonDidTap: addSubject.asObserver(),
//                      roomDetailBtnDidTap: roomDetailSubject.asObserver(),
//                      joinRoomBtnDidTap: joinRoomSubject.asObserver(),
//                      blinkBtnDidTap: blinkSubject.asObserver(),
//                      backBtnDidTap: backSubject.asObserver(),
//                      roomHistoryBtnDidTap: roomHistorySubject.asObserver())
//
//        output = Output(roomName: roomNameSubject.asObservable(),
//                        joinRoomEnable: joinRoomEnableSubject.asObservable(),
//                        isParticipantMode: isParticipantSubject.asObservable())
//
//
//
//
//    }
//
//
//}
