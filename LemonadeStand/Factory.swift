//
//  Factory.swift
//  LemonadeStand
//
//  Created by Peter Roome on 31/05/2015.
//  Copyright (c) 2015 Betahive Ltd. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    class func createCustomers () -> [Customer] {
        var numberOfCustomers = self.numberOfCustomers(10)
        var customerArray:[Customer] = []
        
        for index in 1...numberOfCustomers {
            var tastePreference = self.tastePreference()
            customerArray.append(Customer(tastePreference: tastePreference))
        }
        
        return customerArray
    }
    
    class func numberOfCustomers (max: Int) -> Int {
        var randomNumber = Int(arc4random_uniform(UInt32(max))) + 1
        return randomNumber
    }
    
    class func tastePreference () -> CGFloat {
        // Round the taste prefence to 1 decimal place
        // Keeps it easy for matching!
        let divisor = pow(10.0, CGFloat(1))
        
        var customerTastePreference = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        customerTastePreference = round(customerTastePreference * divisor) / divisor
        
        return customerTastePreference
    }
}