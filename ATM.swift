//
//  ATM.swift
//  Banks
//
//  Created by Sangeetha Nachiar on 11/06/21.
//

import Foundation
class ATM :BankingSystem{
    var totalCash = 10000
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
    func printBalanceReciept(index :Int){
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
                       
                        printBalanceReciept(index:index)
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
            
        


