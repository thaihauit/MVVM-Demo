//
//  LoginViewController.swift
//  Madocon
//
//  Created by Tri Nguyen Minh on 10/31/19.
//  Copyright © 2019 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

class LoginViewController: SecondaryViewController, ControllerType {
    
    // MARK: - Properties
    var viewModel: LoginViewModel!
    let disposeBag = DisposeBag()
    
    var roomId = PublishSubject<String>()
    var currentUser = PublishSubject<String>()
    
    // MARK: - UI
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func bindViewModel() {
        let input = LoginViewModel.Input(currentUserNameTrigger: currentUser.asDriverOnErrorJustComplete(),
                                         userName: userId.rx.text.orEmpty.asDriver(),
                                         LoginTrigger: signInButton.rx.tap.asDriver(),
                                         roomInfoTrigger: roomId.asDriverOnErrorJustComplete())
        
        let output = viewModel.transform(input)
        output.isLoading.drive(loadingBinder).disposed(by: disposeBag)
        output.userName.drive(userNameBinder).disposed(by: disposeBag)
        output.userNameValidation.drive(userNameValidationBinder).disposed(by: disposeBag)
        output.login.drive(loginBinder).disposed(by: disposeBag)
        output.roomInfo.drive(RoomInforBinder).disposed(by: disposeBag)
        
        self.checkCurrentUser()
    }
    
    func checkCurrentUser() {
        let user = CacheManager.shared.getUserName()
        if !user.isEmpty {
            self.currentUser.onNext(user)
        }
    }
    
    func checkRoomInfo() {
        let id = CacheManager.shared.getCurrentRoomId()
        if !id.isEmpty {
            self.roomId.onNext(id)
        }
    }
    
}

extension LoginViewController {
    static func create(with viewModel: LoginViewModel) -> UIViewController {
        let controller = ResourceProvider.getViewController(LoginViewController.self)
        controller.viewModel = viewModel
        return controller
    }
    
    var loadingBinder: Binder<Bool> {
        return Binder(self) { result, vc in
            if vc {
                print("Display Loading")
            } else {
                print("Dissmiss Loading")
            }
        }
    }
    
    var userNameValidationBinder: Binder<Bool> {
        return Binder(self) { result, vc in
            if vc {
                print("ok")
            } else {
                print("the user name is invalid ")
            }
        }
    }
    
    var userNameBinder: Binder<Bool> {
        return Binder(self) { result, vc in
            if vc {
                self.checkRoomInfo()
            } else {
                
            }
        }
    }
    
    var loginBinder: Binder<User> {
        return Binder(self) { result, vc in
            if !vc.user_name.isEmpty {
                CacheManager.shared.saveUserName(value: vc.user_name)
            }
        }
    }
    
    var RoomInforBinder: Binder<RoomInfo> {
        return Binder(self) { result, vc in
            if !vc.roomId.isEmpty {
                CacheManager.shared.saveCurrentRoomId(value: vc.roomId)
            }
        }
    }
    
}

    
