//
//  main.swift
//  Banks
//
//  Created by Sangeetha Nachiar on 11/06/21.
//

import Foundation
class BankingSystem {
    var totalCash = 10000
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
        getScreen()
          banking()
        case 3:
            exit(0)
        default:
        print("Invalid choice hi")
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
                _ = Account(accNo: accountNo, accBalance: accoBalance, transactions: transArray)
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
                _ = Account(accNo: accountNo, accBalance: accoBalance, transactions: transArray)
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
    func getScreen(){
        while(totalCash>0){
                print("\nWelcome To ATM Service")
                 print("1.Withdrawal\n2.Balance Enquiry\n3.exit")
                 print("Enter choice")
                 let choice = Int(readLine()!)
                 switch(choice){
                 case 1:
                     withdrawal()
                 case 2:
                     balanceEnquiry()
                 case 3 :
                    exit(0)
                 default:
                    print("invalid")
                 }
        }
    }
 
    func validatePin(index: Int,pinNo :Int)->Bool{
        if(cards[index].pinNo == pinNo){
            return true
        }
         return false
        }
        func validatePinInvalidCount(index:Int)->Bool{
            if( cards[index].account.pinValidationCount < 3){
                return true
            }
            return false
        }
        
        func validateAmount(amount:Int)->Bool{
            if(amount %  100 == 0){
                return true
            }
            return false
            
        }
        
        func validateAmountQuantity(amount :Int)->Bool{
            if (amount <= 2000){
                return true
            }
            return false
        }
        func getCardsByIndex(accountNo : Int)->Int{
            var result = 0
                    for i in 0..<cards.count{
                        if cards[i].account.accNo == accountNo{
                             result =  i
                        }
                        else{
                             result = -1
                        }
                        
                    }
             return result
            }
    func printTransactionReciept(index: Int,amt:Int){
        print("----------TRANSACTION RECIEPT--------")
        print("Location : Chennai")
        print("Amount Debted : \(amt)")
        print("Available Balance : \(cards[index].account.accBalance)")
    }
    func printBalance(index :Int){
        print("----------BALANCE ENQUIRY RECIEPT--------")
        print("Location : Chennai ")
        print("Available Balance : \(cards[index].account.accBalance )")
    }
    func withdrawal(){
        print("Enter the account No")
        let accountNo = Int(readLine()!)!
        let index = getCardsByIndex(accountNo:accountNo)
        if(index != -1 ){
            if(cards[index].account.accStatus){
             //   if(accounts[index].accStatus){
        print("Enter the pin")
        let pinNo = Int(readLine()!)!
            if(validatePin(index:index,pinNo:pinNo)){
        print("Enter amount in multiple of Rs 100")
         let amt = Int(readLine()!)!
            if(amt <= totalCash){
                if(validateAmount(amount: amt)){
                    if(validateAmountQuantity(amount: amt)){
                        if( amt > totalCash){
                            print("Insufficient Balance")
                        }
                        else{
                           
                            cards[index].account.accBalance -= amt
                           
                            printTransactionReciept(index :index ,amt:amt)
                            totalCash = totalCash - amt
                        }
                    } // end validateAmountQuantity
                    else{
                     print("Maximum amouunt per transaction must not exceed limit of Rs.2000")
                    }
                } // end validateAmount
                else{
                    print("Please enter amount in multiples of Rs 100")
                }
            }  // amt <= cash
            else{
                print("Insufficient balance in ATM")
            }
        } // end validate pin
        else{
            cards[index].account.pinValidationCount += 1
            if(!(validatePinInvalidCount(index:index))) {
                cards[index].account.accStatus = false
               print("Account has been blocked permanently...Due to three invalid attempts")
            }
            else{
                print("invalid pin.. try again")
            }
        }
        }
     else{
          print("Account has been blocked permanently")
                }
            }
        
    else{
                print("Invalid account no .Account doesnot exist")
            }
        }
        
    
                
    
        func  balanceEnquiry(){
            print("Enter account No")
            let accountNo = Int(readLine()!)!
            let index = getCardsByIndex(accountNo: accountNo)
            if(index != -1){
                if(cards[index].account.accStatus){
                    print("Enter your PIN Code")
                    let pinNo = Int(readLine()!)!
                    if(validatePin(index: index, pinNo: pinNo)){
                       
                        printBalance(index:index)
                    } // end validatePin
                    else{
                        cards[index].account.pinValidationCount += 1
                        if(!(validatePinInvalidCount(index:index))){
                                cards[index].account.accStatus  = false
                                print("Account has been blocked permanently...Due to three invalid attempts")
                            }
                            else{
                                print("invalid pin.. try again")
                            }
                        }
                  } // acc.Status
                else{
                    print("Account has been blocked permanently")
                    }
                }
            else{
                 print("Invalid account no .Account doesnot exist")
                }
                        }
        
        
        
                }
            
        


var object = BankingSystem()
object.banking()

