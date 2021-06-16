//
//  Card.swift
//  Banking App
//
//  Created by Sangeetha Nachiar on 14/06/21.
//

import Foundation
class Card{
    var cardNo : Int
    var expiryDate : Int
    var cvv : Int
  var pinNo : Int
var account : Account
var cardStatus : Bool
    var pinValidationCount : Int
    init(cardNo: Int,expiryDate:Int,cvv:Int,pinNo :Int,account:Account,cardStatus:Bool,pinValidationCount:Int){
        self.cardNo = cardNo
        self.expiryDate = expiryDate
        self.cvv = cvv
        self.pinNo = pinNo
         self.account = account
        self.cardStatus = cardStatus
        self.pinValidationCount = pinValidationCount
        
}
    
}
