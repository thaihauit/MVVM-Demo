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

class LoginViewController: PrimaryViewController, ControllerType {
    
    // MARK: - Properties
    var viewModel: LoginViewModel!
    let disposeBag = DisposeBag()
    private let roomId = BehaviorSubject<String>(value: "")
    
    // MARK: - UI
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {
        
        let input = LoginViewModel.Input(currentlUser:Driver.just(CacheManager.shared.getUserName()),
                                         userName:userId.rx.text.orEmpty.asDriver(),
                                         loginDidTap: signInButton.rx.tap.asDriver(),
                                         roomInfoTrigger: roomId.asDriver(onErrorJustReturn: ""))

        let output = viewModel.transform(input)
        output.isLoginEnable.drive(isCheckRoomId).disposed(by: disposeBag)
        output.isLoading.drive(loadingBinder).disposed(by: disposeBag)
        output.login.drive(login).disposed(by: disposeBag)
        output.goRoomMainScreen.drive(isOpenRoomMain).disposed(by: disposeBag)
        output.id.drive().disposed(by: disposeBag)
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
                print("Loading")
            } else {
                print("Not Loading")
            }
        }
    }
    
    var userValidation: Binder<Bool> {
        return Binder(self) { result, vc in
            if vc {
                print("ok")
            } else {
                print("Not ")
            }
        }
    }
    
    var login: Binder<User> {
        return Binder(self) { result, vc in
            if !vc.user_name.isEmpty {
                self.navigateToHistoryScreen()
            }
        }
    }
    
    var isCheckRoomId: Binder<Bool> {
        return Binder(self) { result, vc in
            if vc {
                self.roomId.onNext(CacheManager.shared.getCurrentRoomId())
            } else {
                self.navigateToHistoryScreen()
            }
        }
    }
    
    var isOpenRoomMain: Binder<Bool> {
        return Binder(self) { result, vc in
            if vc {
                self.navigateToRoomMainScreen()
            }
        }
    }
    
    func navigateToRoomMainScreen() {
        let controller = RoomMainViewController.create(with: RoomMainViewModel(useCase: RoomMainUseCase()))
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func navigateToHistoryScreen() {
        let controller = RoomHistoryViewController.create(with: RoomHistoryViewModel(useCase: RoomHistoryUseCase()))
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

    
