//
//  Utils.swift
//  Savements-iOS
//
//  Created by SVYAT on 31.07.15.
//  Copyright (c) 2015 HiT2B. All rights reserved.
//

import UIKit

class Utils {
    
    func colorFromRGB (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        let redValue = red/255
        let greenValue = green/255
        let blueValue = blue/255
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: alpha)
    }
}