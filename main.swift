//
//  main.swift
//  Banking App
//
//  Created by Sangeetha Nachiar on 14/06/21.
//


import Foundation

protocol authenticate {
    func validate(index:Int,password :Int)->Bool
}


class Manager {
    func getChoice(){
    print("1.Bank\n2.Online Banking\n3.ATM ")
        let ch = Int(readLine()!)
        switch(ch){
        case 1:
         var ban = Bank()
          getChoice()
            getChoice()
        case 2:
            var  obj = OnlineBanking()
            obj.getChoice1()
            getChoice()
        case 3:
           var atm =  ATM()
            atm.getScreen()
            getChoice()
        default :
            print("Invalid")
        }
}
}
var obj = Manager()
obj.getChoice()
