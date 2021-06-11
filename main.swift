//
//  main.swift
//  Banks
//
//  Created by Sangeetha Nachiar on 11/06/21.
//

import Foundation
class BankingSystem {
    
    var accounts :[Account]  = [Account(accNo: 1,accBalance: 1000, transactions: [Transaction(amount: 90, description: "Food")] ) ]
    var cards:[Card] = [ Card(pinNo: 8998, account: Account(accNo: 1,  accBalance: 1000, transactions: [Transaction(amount: 0, description: "")] )) ]
   
    func banking(){
    print("1. Online Banking 2. ATM  3.Exit")
    let yourChoice = Int(readLine()!)
        switch(yourChoice){
        case 1:
        getChoice()
        banking()
        case 2:
            let atm = ATM()
            atm.getScreen()
          banking()
        case 3:
            exit(0)
        default:
        print("Invalid choice ")
        }
    }
    
    func getChoice(){
        print("\n1.Add Your Account\n2.Add Your Credit Cards\n3.FundTransfer\n4.Transaction History\n5.Exit")
        print("\nEnter  your choice")
        let choice = Int(readLine()!)
        switch(choice){
        case 1:
           addAccount()
            
        case 2:
           addCreditCards()
           
        case 3:
           fundTransfer()
           
        case 4:
            transactionHistory()
            
        case 5:
            exit(0)
        default:
            print("Invalid choice")
            
        }
    }
    

    var  myAccount : Account =  Account(accNo: 0, accBalance: 0, transactions: [Transaction(amount: 0, description: "")])
    
    func addAccount(){
        print("Enter the account Number")
        let accountNo = Int(readLine()!)!
        print("Enter account Balance")
        let  accountBalance = Int(readLine()!)!
        myAccount = Account(accNo: accountNo,accBalance: accountBalance, transactions: [])
        print("Account Added")
    }
    
    var myCreditCard : Card = Card(pinNo: 0, account: Account(accNo: 0, accBalance: 0, transactions: []))
    
    func addCreditCards(){
        print("Enter the account Number")
        let accountNo = Int(readLine()!)!
        print("Enter pin ")
        let accountPin = Int(readLine()!)!
        print("Enter account Balance")
        let  accountBalance = Int(readLine()!)!
        
        myCreditCard = Card(pinNo: accountPin, account: Account(accNo: accountNo, accBalance: accountBalance, transactions: [Transaction(amount: 0, description: "")]))
        cards.append(myCreditCard)
        print("Card Added")
        }
    var  accoBalance: Int = 0
    var transArray : [Transaction] = []
    func fundTransfer(){
        print("1.From Bank Account\n2.From Credit Cards")
        print("\nEnter your choice")
        let ch = Int(readLine()!)!
       print("Enter the Benficiary account Number")
        let accountNo = Int(readLine()!)!
        print("Enter the amount")
        let amt = Int(readLine()!)!
        print("Enter Description")
        let des = readLine()!
        let trans = Transaction(amount:amt,description : des)
       transArray.append(trans)
       if(ch == 1){
            if(amt < myAccount.accBalance){
            myAccount.accBalance -= amt
            myAccount.transactions.append(trans)
            accoBalance += amt
                var benAccount = Account(accNo: accountNo, accBalance: accoBalance, transactions: transArray)
                print("Amount transfered")
            }
            else{
                print("Amount insufficient in your account")
            }
        }
        if(ch == 2){
            if(amt < myCreditCard.account.accBalance){
                myCreditCard.account.accBalance -= amt
                myCreditCard.account.transactions.append(trans)
                accoBalance += amt
              var  benAccount = Account(accNo: accountNo, accBalance: accoBalance, transactions: transArray)
                print("Amount transfered")
            }
            else{
                print("Amount insufficient in your account")
            }
        }
    }
    func transactionHistory(){
        print("--------TRANSACTION HISTORY--------")
        for item in myAccount.transactions{
            print("Amount : \(item.amount)  Description: \(item.description!) Balance:\(myAccount.accBalance)")
        }
    }
}
var object = BankingSystem()
object.banking()

    
