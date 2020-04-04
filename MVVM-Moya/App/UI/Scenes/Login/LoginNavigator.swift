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
    
}

struct LoginNavigator: LoginNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
}
