//
//  LemonadeBrain.swift
//  LemonadeStand
//
//  Created by Peter Roome on 31/05/2015.
//  Copyright (c) 2015 Betahive Ltd. All rights reserved.
//

import Foundation
import UIKit

class LemonadeBrain {
    
    class func mix (lemons: Int, iceCubes: Int) -> CGFloat {
        // Round the lemonade mix to 1 decimal place
        // Keeps it easy for matching!
        let divisor = pow(10.0, CGFloat(1))

        var ratio = CGFloat(lemons) / CGFloat(iceCubes)
        ratio = round(ratio * divisor) / divisor
        
        return ratio
    }

    // Example
    // For example, If customerPreference is Less than 0.4 
    // AND lemonadeRatio is Greater than 1... 
    // Get paid a $1 and print out "Paid!"
    class func computeEarnings (customers: [Customer], mix: CGFloat) -> Int {
        var earnings = 0
        
        for customer in customers {
            var preference = customer.tastePreference
            
            if preference < 0.4 && mix > 1.0 {
                earnings += 1
                println("PAID - Customer Taste: \(preference)")
            } else if preference >= 0.4 && preference <= 0.6 && mix == 1.0 {
                earnings += 1
                println("PAID - Customer Taste: \(preference)")
            } else if preference > 0.6 && mix < 1.0  {
                earnings += 1
                println("PAID - Customer Taste: \(preference)")
            } else {
                println("NO MATCH, NO REVENUE - Customer Taste: \(preference)")
            }
        }
        
        return earnings
    }
}