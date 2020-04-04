//
//  MainViewController.swift
//  Madocon
//
//  Created by Ha Nguyen Thai on 10/22/19.
//  Copyright © 2019 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

class RoomMainViewController: SecondaryViewController {
    
    typealias ViewModelType = RoomMainViewModel
    
    // MARK: - Properties
    var viewModel: ViewModelType!
    let disposeBag = DisposeBag()
    var cacheManager: CacheManager!
    
    // MARK: - UI
    @IBOutlet weak var roomInfoButton: UIButton!
    @IBOutlet weak var participantButton: UIButton!
    @IBOutlet weak var addButton: BCUNormalButton!
    @IBOutlet weak var roomAvatarImage: UIImageView!
    @IBOutlet weak var roomDetailButton: BCUNormalButton!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var joinRoomButton: BCUNormalButton!
    @IBOutlet weak var blinkButton: BCUNormalButton!
    @IBOutlet weak var homeButton: BCUNormalButton!
    @IBOutlet weak var roomHistoryButton: BCUNormalButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //input(with: viewModel)
        //output(with: viewModel)
        bindViewModel()
    }
    
    // MARK:- DI
    func setCacheManager(cacheManager: CacheManager) {
        self.cacheManager = cacheManager
    }
    
//    func input(with viewModel: RoomMainViewModel) {
//
//        roomInfoButton
//        .rx
//        .tap
//        .bind(to: viewModel.input.roomInfoBtnDidTap)
//        .disposed(by: disposeBag)
//
//        participantButton
//        .rx
//        .tap
//        .bind(to: viewModel.input.roomParticipantDidTap)
//        .disposed(by: disposeBag)
//
//        addButton
//        .rx
//        .tap
//        .bind(to: viewModel.input.addButtonDidTap)
//        .disposed(by: disposeBag)
//
//        roomDetailButton
//        .rx
//        .tap
//        .bind(to: viewModel.input.roomDetailBtnDidTap)
//        .disposed(by: disposeBag)
//
//        joinRoomButton
//        .rx
//        .tap
//        .bind(to: viewModel.input.joinRoomBtnDidTap)
//        .disposed(by: disposeBag)
//
//        blinkButton
//        .rx
//        .tap
//        .bind(to: viewModel.input.blinkBtnDidTap)
//        .disposed(by: disposeBag)
//
//        homeButton
//        .rx
//        .tap
//        .bind(to: viewModel.input.backBtnDidTap)
//        .disposed(by: disposeBag)
//
//        roomHistoryButton
//        .rx
//        .tap
//        .bind(to: viewModel.input.roomHistoryBtnDidTap)
//        .disposed(by: disposeBag)
//    }
//
//    func output(with viewModel: RoomMainViewModel) {
//
//
//    }

}

extension RoomMainViewController: ControllerType {
    func bindViewModel() {
        
    }
    
    static func create(with viewModel: RoomMainViewModel) -> UIViewController {
        let controller = ResourceProvider.getViewController(RoomMainViewController.self)
        controller.viewModel = viewModel
        controller.setCacheManager(cacheManager: CacheManager.init(userDefaults: .standard))
        return controller
    }
}
