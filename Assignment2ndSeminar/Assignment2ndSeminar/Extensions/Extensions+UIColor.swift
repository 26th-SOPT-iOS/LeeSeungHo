//
//  Extensions+UIColor.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/04/26.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

enum AssetsColor {
    // Button Color
    case defaultGrayColor
    case darkGrayColor
    case orangeColor
}

extension UIColor {
    
    static func calculatorColor(_ name: AssetsColor) -> UIColor {
        
        switch name {
            
        case .defaultGrayColor:
            return UIColor(displayP3Red: 166/255, green: 166/255, blue: 166/255, alpha: 1)
        case .darkGrayColor:
            return UIColor(displayP3Red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        case .orangeColor:
            return UIColor(displayP3Red: 251/255, green: 147/255, blue: 55/255, alpha: 1)
            
        default:
            assert(false)
        }
    }
}
