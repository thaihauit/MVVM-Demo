//
//  AppConfig.swift
//  VIPER
//
//  Created by Ha Nguyen Thai on 9/25/19.
//  Copyright © 2019 Ace. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class AppConfig : NSObject {

static let sharedInstance = AppConfig()
    
    let baseURL = ""
    static func getUuidDevice() -> String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
}


