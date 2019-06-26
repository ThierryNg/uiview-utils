//
//  UIView+Borders.swift
//
//  Created by Thierry Ng on 09/08/2018.
//  Copyright © 2018 Thierry Ng. All rights reserved.
//

import UIKit

extension UIView {

    enum Side {
        case left, right, top, bottom
    }

    func addBorder(side: Side, color: CGColor, thickness: CGFloat) {

        let border = CALayer()
        border.backgroundColor = color

        switch side {
        case .left: border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right: border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        case .top: border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom: border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        }

        self.layer.addSublayer(border)
    }
}
