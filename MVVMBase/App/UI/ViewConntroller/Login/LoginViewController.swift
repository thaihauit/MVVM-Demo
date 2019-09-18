//
//  LoginViewController.swift
//  MVVMBase
//
//  Created by Ha Nguyen Thai on 6/20/19.
//  Copyright © 2019 Ace. All rights reserved.
//

import UIKit

class LoginViewController: SecondaryViewController {
    
    @IBOutlet weak var userName: UITextField!
    var loginViewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        UserRestApi.shared.saveNewUser("awdawd") { (response) in
            let user = response.data as! User
            let loginViewModel = LoginViewModel.init(user: user)
            if loginViewModel.isLoginSuccess {
                let controller = ResourceProvider.getViewController(MainViewController.self)
                controller.moveScreenOnTop()
                self.navigateToScreen(controller)
            }
        }
    }
    


}
