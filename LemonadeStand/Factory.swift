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
    class func createCustomers (weather: String) -> [Customer] {
        var customerRange:Int
        customerRange = 20
        
        switch weather {
            case "Cold":
                customerRange -= Int(arc4random_uniform(UInt32(10)))
            case "Mild":
                customerRange += Int(arc4random_uniform(UInt32(2)))
            case "Warm":
                customerRange += Int(arc4random_uniform(UInt32(30)))
            default:
                customerRange += 0
        }
        
        var numberOfCustomers = self.numberOfCustomers(customerRange)
        println("Number of customers: \(customerRange)")
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
    
    class func todaysWeather () -> String {
        var weathers = ["Cold", "Mild", "Warm"]
        var randomNumber = Int(arc4random_uniform(UInt32(weathers.count)))
        var weather = weathers[randomNumber]
        
        return weather
    }
}