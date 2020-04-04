//
//  RoomHistoryAssemble.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 4/1/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import UIKit

protocol RoomHistoryAssembler {
    func resolve(navigationController: UINavigationController) -> RoomHistoryViewController
    func resolve(navigationController: UINavigationController) -> RoomHistoryViewModel
    func resolve(navigationController: UINavigationController) -> RoomHistoryNavigatorType
    func resolve() -> RoomHistoryUseCaseType
}

extension RoomHistoryAssembler {
    func resolve(navigationController: UINavigationController) -> RoomHistoryViewController {
        let vc = ResourceProvider.getViewController(RoomHistoryViewController.self)
        let vm: RoomHistoryViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> RoomHistoryViewModel {
        return RoomHistoryViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension RoomHistoryAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> RoomHistoryNavigatorType {
        return RoomHistoryNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> RoomHistoryUseCaseType {
        return RoomHistoryUseCase()
    }
}
