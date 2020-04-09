//
//  RoomHistoryViewController.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/17/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

class RoomHistoryViewController: SecondaryViewController, ControllerType {
    
    
    
    typealias ViewModelType = RoomHistoryViewModel
    
    // MARK:- Outlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteRoomButton: BCUNormalButton!
    @IBOutlet weak var editRoomButton: BCUNormalButton!
    @IBOutlet weak var backButton: BCUNormalButton!
    @IBOutlet weak var createRoomButton: BCUNormalButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    
    @IBOutlet weak var roomId_1: UILabel!
    @IBOutlet weak var roomId_2: UILabel!
    @IBOutlet weak var roomId_3: UILabel!
    @IBOutlet weak var roomId_4: UILabel!
    @IBOutlet weak var roomId_5: UILabel!
    @IBOutlet weak var roomId_6: UILabel!
    
    
    // MARK: - Properties
    var viewModel: ViewModelType!
    let disposeBag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func bindViewModel() {
        
    }
    
    
}
