//
//  RoomDetailAssemble.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 4/1/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import UIKit

protocol RoomDetailAssembler {
    func resolve(navigationController: UINavigationController) -> RoomDetailViewController
    func resolve(navigationController: UINavigationController) -> RoomDetailViewModel
    func resolve(navigationController: UINavigationController) -> RoomDetailNavigatorType
    func resolve() -> RoomDetailUseCaseType
}

extension RoomDetailAssembler {
    func resolve(navigationController: UINavigationController) -> RoomDetailViewController {
        let vc = ResourceProvider.getViewController(RoomDetailViewController.self)
        let vm: RoomDetailViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> RoomDetailViewModel {
        return RoomDetailViewModel (
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension RoomDetailAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> RoomDetailNavigatorType {
        return RoomDetailNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> RoomDetailUseCaseType {
        return RoomDetailUseCase()
    }
}
