//
//  DecimalUtil.swift
//  Bankey
//
//  Created by Dishant Nagpal on 18/11/23.
//

import Foundation

extension Decimal {
    var doubleValue : Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
