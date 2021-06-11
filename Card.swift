//
//  Card.swift
//  Banks
//
//  Created by Sangeetha Nachiar on 10/06/21.
//

import Foundation
class Card{
    var pinNo : Int
    var account : Account
    init(pinNo :Int,account:Account){
        self.pinNo = pinNo
        self.account = account
    }
}
