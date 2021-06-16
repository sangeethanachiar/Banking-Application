//
//  Bank.swift
//  Banking App
//
//  Created by Sangeetha Nachiar on 14/06/21.
//

import Foundation
class Bank{
  
    
    var accounts :[Account]  = []
   var cards:[Card] = []
    func getChoice2(){
        print("1.Admin\n2.User")
        let ch = Int(readLine()!)!
        switch(ch){
        case 1:
            print("1.Open Account\n2.Issue Card\n3.Close Account\n")
            let ch1 = Int(readLine()!)!
            switch(ch1){
            case 1:
                openAccount()
                
                getChoice2()
                
                
            case 2:
                issueCard()
                getChoice2()
            case 3:
                closeAccount()
                getChoice2()
            default:
                print("invalid")
            }
        case 2:
            print("1.Deposit cash\n2.TransferFunds")
            let ch2 = Int(readLine()!)!
            switch(ch2){
            case 1:
                depositCash()
            case 2:
                print("..")
                //transferFunds()
            default:
                print("invalid")
            }
        default :
            print("Invalid Choice")
        }
    }
    func getAccountByIndex(accountNo: Int)->Int{
        var result = 0
       // for item in accounts{
        func viewAccounts(){
            for  i in 0..<accounts.count{
                print("\(i)   \(accounts[i].accNo)")
            }
        }
        viewAccounts()
        print("\(accounts.count)")
        if(accounts.count == 0 ){
            print("Account does not exist")
        }
       
        for i in 0..<accounts.count{
            if accounts[i].accNo == accountNo{
                         result =  i
                    }
                    else{
                         result = -1
                    }
                    
                }
         return result
        
    }
    func getCardsByIndex(cardNo: Int)->Int{
        var result = 0
        for i in 0..<cards.count{
            if cards[i].cardNo == cardNo{
                         result =  i
                print("\(i)")
                    }
                    else{
                         result = -1
                        print("\(i)")
                    }
                    
                }
         return result
    }
    
    var accountNumber = 1
    func openAccount(){
       
        print("Enter min amount greater than or equal to 500 to open an account")
        let amount = Double(readLine()!)!
        if(amount > 500){
        var account = Account(accNo: accountNumber,accBalance:amount , transactions: [])
        print("Account Created. Account No : \(accountNumber)")
        accounts.append(account)
            print(accounts.count)
        accountNumber += 1
        }
        else{
            print("Amount less than minimum balance")
        }
    }
    func closeAccount(){
        print("Enter account No")
        var accountNo = Int(readLine()!)!
        var index = getAccountByIndex(accountNo: accountNo)
        accounts.remove(at: index)
        print("Account Closed")
    }
    var cardNo = 1111111111111111
    var expirydate = 0125
    var cvv = 890
    func issueCard(){
        print("Enter account Number")
        let accountNo = Int(readLine()!)!
        var ind  = getAccountByIndex(accountNo: accountNo)
        
        print("Enter your pin")
        let pin = Int(readLine()!)!
        var card = Card(cardNo: cardNo, expiryDate: expirydate, cvv: cvv, pinNo: pin, account: accounts[ind],cardStatus:true,pinValidationCount : 0)
        cards.append(card)
        print("Card issued.Card No : \(cardNo)")
        cardNo += 1
        expirydate += 1
        cvv += 1
        
        func viewCards(){
            for i  in 0..<cards.count{
                print("\(i)     \(cards[i].cardNo)")
            }
        }
        viewCards()
    }
    func depositCash(){
        print("Enter account Number")
        let accountNo = Int(readLine()!)!
        print("Enter Amount")
        let amt = Double(readLine()!)!
        var ind  = getAccountByIndex(accountNo: accountNo)
        accounts[ind].accBalance += amt
        print("Anount added. Account Balance :\(accounts[ind].accBalance)")
    }
}

