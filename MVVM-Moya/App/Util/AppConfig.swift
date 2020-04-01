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
    
    let baseURL = "http://ec2-3-112-198-223.ap-northeast-1.compute.amazonaws.com/bcom/api/"
    
    static func getUuidDevice() -> String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
}


