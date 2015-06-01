//
//  LemonadeBrain.swift
//  LemonadeStand
//
//  Created by Peter Roome on 31/05/2015.
//  Copyright (c) 2015 Betahive Ltd. All rights reserved.
//

import Foundation

class LemonadeBrain {
    
    class func mix (lemons: Int, iceCubes: Int) -> Float {
        var ratio = Float(lemons) / Float(iceCubes)
        return ratio
    }
    
    // Example
//    class func computeEarnings (customers: [Customer], mix: Float) -> Int {
//        for customer in mix {
//            if customer.tastePreference < 0.4 && LemonadeBrain.mix
//        }
//        
//        return 0
//    }
}