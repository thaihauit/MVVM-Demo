//
//  RoomDetailViewController.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/17/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

class RoomDetailViewController: PrimaryViewController {
    
    typealias ViewModelType = RoomDetailViewModel
    
    //MARK:- Outlet
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    @IBOutlet weak var addButton: BCUNormalButton!
    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var editAvatarButton: UIButton!
    @IBOutlet weak var roomNameTxt: UITextField!
    
    @IBOutlet weak var blinkButton: BCUNormalButton!
    @IBOutlet weak var backButton: BCUNormalButton!
    @IBOutlet weak var roomHistoryButton: BCUNormalButton!
    
    // MARK: - Properties
    var viewModel: ViewModelType!
    let disposeBag = DisposeBag()
    
    // MARK:- Register Observable
    func input(with viewModel: RoomDetailViewModel) {
        
        
        
    }
    
    func output(with viewModel: RoomDetailViewModel) {
        
    }
    
    
    
    
}

extension RoomDetailViewController {
    static func create(with viewModel: RoomDetailViewModel) -> UIViewController {
        let controller = ResourceProvider.getViewController(RoomDetailViewController.self)
        controller.viewModel = viewModel
        return controller
    }
}
