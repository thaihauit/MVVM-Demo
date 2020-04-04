//
//  ControllerType.swift
//  MVVM-RxSwift-LoginFlow
//
//  Created by Alexey Savchenko on 6/19/18.
//  Copyright © 2018 Alexey Savchenko. All rights reserved.
//

import UIKit

public protocol ControllerType: class {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

extension ControllerType where Self: UIViewController {
    public func bindViewModel(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
