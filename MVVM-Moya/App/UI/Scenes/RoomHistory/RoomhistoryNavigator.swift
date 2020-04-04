//
//  RoomhistoryNavigator.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 4/1/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import UIKit

protocol RoomHistoryNavigatorType {
    
}

struct RoomHistoryNavigator: RoomHistoryNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    
}
