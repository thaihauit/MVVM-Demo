//
//  AppNavigator.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/25/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import UIKit

protocol AppNavigatorType {
    func toRoot()
}

struct AppNavigator: AppNavigatorType {
    unowned let assembler: Assembler
    unowned let window: UIWindow
    
    func toRoot() {
        let nav = UINavigationController()
        let vc: LoginViewController = assembler.resolve(navigationController: nav)
        nav.viewControllers.append(vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
