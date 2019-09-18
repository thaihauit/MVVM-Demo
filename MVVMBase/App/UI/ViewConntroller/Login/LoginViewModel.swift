//
//  LoginViewModel.swift
//  MVVMBase
//
//  Created by Ha Nguyen Thai on 6/20/19.
//  Copyright © 2019 Ace. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    private var user: User?
    
    var isLoginSuccess: Bool {
        return !user!.id.isEmpty
    }
    
    init(user: User) {
        self.user = user
    }
    
    
}
