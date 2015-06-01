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
        var numberOfCustomers = self.numberOfCustomers()
        var customerArray:[Customer] = []
        
        for index in 1...numberOfCustomers {
            var tastePreference = self.tastePreference()
            customerArray.append(Customer(tastePreference: tastePreference))
            println(tastePreference)
        }
        
        return customerArray
    }
    
    class func numberOfCustomers () -> Int {
        var randomNumber = Int(arc4random_uniform(UInt32(10)))
        return randomNumber
    }
    
    class func tastePreference () -> CGFloat {
        var customerTastePreference = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return customerTastePreference
    }
}