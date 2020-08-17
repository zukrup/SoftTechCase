//
//  NumberExtensions.swift
//  MyX
//
//  Created by Musa Fedakar on 17/06/16.
//  Copyright © 2016 Br Magazacilik. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
