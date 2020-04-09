//
//  SceneDelegate.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 12/3/19.
//  Copyright © 2019 Ha Nguyen Thai. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var deviceId = PublishSubject<String>()
    var currentToken = PublishSubject<String>()
    var assembler: Assembler = DefaultAssembler()
    let disposeBag = DisposeBag()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            binđData()
            self.window!.makeKeyAndVisible()
        }
    }
    
    func binđData() {
        
        guard let window = window else { return }
        let viewModel: AppViewModel = assembler.resolve(window: window)
        viewModel.navigator.toRoot()
        
        let input = AppViewModel.Input(generateToken: deviceId.asDriverOnErrorJustComplete(), tokenTrigger: currentToken.asDriverOnErrorJustComplete())
        
        let output = viewModel.transform(input)
        output.hasToken.drive(tokenBinder).disposed(by: disposeBag)
        output.token.drive(token).disposed(by: disposeBag)
        
        if !CacheManager.shared.getApiToken().isEmpty {
            currentToken.onNext(CacheManager.shared.getApiToken())
        } else {
            deviceId.onNext(AppConfig.getUuidDevice())
        }
        
    }
    
    var tokenBinder: Binder<Bool> {
        return Binder(self) { result, vc in
            if !vc {
                print("Don't has token")
            } else {
                print("Had Token")
            }
        }
    }
    
    var token: Binder<Token> {
        return Binder(self) { result, vc in
            
            print(vc)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

