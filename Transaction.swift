//
//  Transaction.swift
//  Banking App
//
//  Created by Sangeetha Nachiar on 14/06/21.
//

import Foundation
class Transaction{
    var amount : Double
   // var transactionCount : Int
    var description : String?
    init(amount:Double,description :String){
        self.amount = amount
      //  self.transactionCount = transactionCount
        self.description = description
    }
}

