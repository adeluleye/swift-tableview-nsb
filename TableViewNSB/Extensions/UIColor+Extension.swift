//
//  UIColor+Extension.swift
//  TableViewNSB
//
//  Created by ADELU ABIDEEN ADELEYE on 10/6/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
