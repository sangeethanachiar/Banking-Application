//
//  Transaction.swift
//  Banks
//
//  Created by Sangeetha Nachiar on 11/06/21.
//

import Foundation



class Transaction{
    var amount : Int
    var description : String?
    init(amount:Int,description :String){
        self.amount = amount
        self.description = description
    }
}

