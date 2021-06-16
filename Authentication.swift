//
//  Authentication.swift
//  Banking App
//
//  Created by Sangeetha Nachiar on 14/06/21.
//

import Foundation
class Authentication : authenticate{
    var ban = Bank()
    func validate(index: Int,password  :Int)->Bool{
        if(ban.cards[index].pinNo == password){
            return true
        }
         return false
        }
        func validatePinInvalidCount(index:Int)->Bool{
            if(ban.cards[index].pinValidationCount < 3){
                return true
            }
            return false
        }
        
        
}
