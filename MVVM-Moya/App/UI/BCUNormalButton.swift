//
//  BCUNormalButton.swift
//  MVVM-Moya
//
//  Created by Ha Nguyen Thai on 2/17/20.
//  Copyright © 2020 Ha Nguyen Thai. All rights reserved.
//

import UIKit

class BCUNormalButton: UIButton {

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
}
