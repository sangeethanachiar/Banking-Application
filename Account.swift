//
//  Account.swift
//  Banks
//
//  Created by Sangeetha Nachiar on 10/06/21.
//

import Foundation
class Account{
    var accNo : Int
    var accBalance : Int
    var transactions : [Transaction]
    var accStatus : Bool = true
    var pinValidationCount = 0
    
    init(accNo:Int,accBalance:Int,transactions:[Transaction]){
        self.accNo = accNo
        self.accBalance = accBalance
        self.transactions = transactions
        
    }
}
