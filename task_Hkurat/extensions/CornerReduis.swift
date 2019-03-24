//
//  CornerReduis.swift
//  task_Hkurat
//
//  Created by youssef on 3/23/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class CornerReduis: UIView {

    @IBInspectable var cornerReduis : CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerReduis
        }
    }

}
class BtnCornerReduis: UIButton {
    @IBInspectable var corner_Reduis : CGFloat = 0.0 {
        didSet{
            layer.cornerRadius = corner_Reduis
        }
    }
}
