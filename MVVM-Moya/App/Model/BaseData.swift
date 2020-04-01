//
//  BaseData.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 3/15/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation

struct BaseData {
    var message: String
}

extension BaseData: Decodable {
    
    enum DataKey: String, CodingKey {
        case data
    }
    
    enum DataCodingKey: String, CodingKey {
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DataKey.self)
        let detailContainer = try container.nestedContainer(keyedBy: DataCodingKey.self, forKey: .data)
        message = try detailContainer.decode(String.self, forKey: .message)
    }
}
