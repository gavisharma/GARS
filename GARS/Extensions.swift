//
//  Extensions.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-27.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation

//extension to Double type to display as currency
extension Double{
    var asCurrency: String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.string(for: self)!
    }
}

extension Int {
    func toString() -> String {
        let myString = String(self)
        return myString
    }
}
