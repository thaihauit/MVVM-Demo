//
//  BaseResponseObjectParser.swift
//  B+Com U
//
//  Created by Ha Nguyen Thai on 5/20/19.
//  Copyright © 2019 Cloud 9. All rights reserved.
//

import Foundation

protocol Parsable {
    func parseInBackground(_ data: Dictionary<String, AnyObject>, apiResponse: ApiSuccess?, _ completion: @escaping ((ApiSuccess) -> Void))
    func parseArrayInBackground(_ dataArray: [Dictionary<String, AnyObject>], apiResponse: ApiSuccess?, _ completion: @escaping ((ApiSuccess) -> Void))
}

class BaseResponseObjectParser<T: Any> {
    
    func parse(_ obj: Dictionary<String, AnyObject>) -> T {
        return self.parseObject(obj)
    }
    
    func parseArray(_ arrayObj: [Dictionary<String, AnyObject>]) -> [T] {
        var objs:[T] = []
        for obj in arrayObj {
            objs.append(self.parse(obj))
        }
        return objs
    }
    
    internal func parseObject(_ objData: Dictionary<String, AnyObject>) -> T {
        preconditionFailure("This method must be overridden")
    }
    
}

extension BaseResponseObjectParser: Parsable {
    
    func parseInBackground(_ data: Dictionary<String, AnyObject>, apiResponse: ApiSuccess?, _ completion: @escaping ((ApiSuccess) -> Void)) {
        DispatchQueue.main.async {
            let obj = self.parse(data)
            if apiResponse != nil {
                apiResponse!.data = obj
            }
            completion(apiResponse!)
        }
    }
    
    func parseArrayInBackground(_ dataArray: [Dictionary<String, AnyObject>], apiResponse: ApiSuccess?, _ completion: @escaping ((ApiSuccess) -> Void)) {
        DispatchQueue.main.async {
            let objs = self.parseArray(dataArray)
            if apiResponse != nil {
                apiResponse!.data = objs
            }
            completion(apiResponse!)
        }
    }
}
