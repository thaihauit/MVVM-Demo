//
//  ViewModelType.swift
//  MVVM-RxSwift-LoginFlow
//
//  Created by Alexey Savchenko on 6/19/18.
//  Copyright © 2018 Alexey Savchenko. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

/// Base for all controller viewModels.
///
/// It contains Input and Output types, usually expressed as nested structs inside a class implementation.
///
/// Input type should contain observers (e.g. AnyObserver) that should be subscribed to UI elements that emit input events.
///
/// Output type should contain observables that emit events related to result of processing of inputs.


public protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
    
}

extension ViewModelType {
    func validate<T>(object: Driver<T>,
                     trigger: Driver<Void>,
                     validator: @escaping (T) -> Bool) -> Driver<Bool> {
        return Driver.combineLatest(object, trigger)
            .map { $0.0 }
            .map { validator($0) }
            .startWith(true)
    }
    
    func loadingValidate<T>(object: Driver<T>,
                     trigger: Driver<Void>,
                     validator: @escaping (T) -> Bool) -> Driver<Bool> {
        return Driver.combineLatest(object, trigger)
            .map { $0.0 }
            .map { validator($0) }
            .startWith(false)
    }
}
