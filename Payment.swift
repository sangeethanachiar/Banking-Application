//
//  Payment.swift
//  Banking App
//
//  Created by Sangeetha Nachiar on 15/06/21.
//

import Foundation
class Payment{
    func makePayment1(amount :inout  Double)->Double{
        
        var serviceTax : Float = 5.2
        var vat : Float = 2.3
        var d1  = amount + (amount * Double(serviceTax) / 100)
        var d =  d1 * Double (vat / 100 )
        return d + d1
    }
    
    
    
}
