//
//  Extensions+Formatter.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/04/26.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension Int {
    
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
