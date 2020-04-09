//
//  LoginNavigator.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/20/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import UIKit

protocol LoginNavigatorType {
    func navigateToRoomHistory()
    func navigateToRoomMain()
}

struct LoginNavigator: LoginNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func navigateToRoomHistory() {
        let vc: RoomHistoryViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToRoomMain() {
        let vc: RoomMainViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
