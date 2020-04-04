//
//  RoomMainAssembler.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 4/1/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import UIKit

protocol RoomMainAssembler {
    func resolve(navigationController: UINavigationController) -> RoomMainViewController
    func resolve(navigationController: UINavigationController) -> RoomMainViewModel
    func resolve(navigationController: UINavigationController) -> RoomMainNavigatorType
    func resolve() -> RoomMainUseCaseType
}

extension RoomMainAssembler {
    func resolve(navigationController: UINavigationController) -> RoomMainViewController {
        let vc = ResourceProvider.getViewController(RoomMainViewController.self)
        let vm: RoomMainViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> RoomMainViewModel {
        return RoomMainViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension RoomMainAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> RoomMainNavigatorType {
        return RoomMainNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> RoomMainUseCaseType {
        return RoomMainUseCase()
    }
}
