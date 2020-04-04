//
//  LoginAssembler.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/20/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import UIKit

protocol LoginAssembler {
    func resolve(navigationController: UINavigationController) -> LoginViewController
    func resolve(navigationController: UINavigationController) -> LoginViewModel
    func resolve(navigationController: UINavigationController) -> LoginNavigatorType
    func resolve() -> LoginUseCaseType
}

extension LoginAssembler {
    func resolve(navigationController: UINavigationController) -> LoginViewController {
        let vc = ResourceProvider.getViewController(LoginViewController.self)
        let vm: LoginViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> LoginViewModel {
        return LoginViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension LoginAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> LoginNavigatorType {
        return LoginNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> LoginUseCaseType {
        return LoginUseCase()
    }
}
